#include <string>
#include <algorithm>
#include <iomanip>
#include "util.h"
#include "Data.h"
#include "fm_learn.h"
#include "fm_learn_mcmc_simultaneous.h"


int main(int argc, char **argv) {
	std::string param_train_file = "E:\\vs2015_workspace\\copy\\train.txt";
	std::string param_test_file = "E:\\vs2015_workspace\\copy\\test.txt";
	std::string param_out_file = "E:\\vs2015_workspace\\copy\\output.txt";

	if (argc == 4) {
		param_train_file = argv[1];
		param_test_file = argv[2];
		param_out_file = argv[3];
	}

 	srand (static_cast<uint>(time(nullptr)));
	try {
        unsigned short param_cache_size = 100;
        //const std::string param_method = "mcmc";
        const double param_init_stdev = 0.1;
        const std::vector<int> param_dim = {1,1,2};
        /*const std::string param_train_file = "E:\\vs2015_workspace\\copy\\ijcnn1.tr";
        const std::string param_test_file = "E:\\vs2015_workspace\\copy\\ijcnn1.t";
		const std::string param_train_file = "E:\\vs2015_workspace\\copy\\train.txt";
		const std::string param_test_file = "E:\\vs2015_workspace\\copy\\test.txt";
        const std::string param_out_file = "E:\\vs2015_workspace\\copy\\output.txt";*/
        const std::string param_meta_file;
        const int param_num_iter = 10000;

		Data train(
			param_cache_size,
			false, // no original data for mcmc
			true // no transpose data for sgd, sgda
		);
		train.load(param_train_file);
		Data test(
			param_cache_size,
			false, // no original data for mcmc
			true // no transpose data for sgd, sgda
		);
		test.load(param_test_file);
		Data* validation = nullptr;
		DVector<RelationData*> relation = NULL;
				// (main table)
		unsigned short num_all_attribute = std::max(train.num_feature, test.num_feature);

        
        DataMetaInfo meta_main(num_all_attribute);
		if (param_meta_file.length() != 0) {
			meta_main.loadGroupsFromFile(param_meta_file);
		}
		
		// build the joined meta table
		for (unsigned short r = 0; r < train.relation.dim; r++) {
			train.relation(r).data->attr_offset = num_all_attribute;
			num_all_attribute += train.relation(r).data->num_feature;
		}
		DataMetaInfo meta(num_all_attribute);
		{
			meta.num_attr_groups = meta_main.num_attr_groups;
			for (unsigned short r = 0; r < relation.dim; r++) {
				meta.num_attr_groups += relation(r)->meta->num_attr_groups;
			}
			meta.num_attr_per_group.setSize(meta.num_attr_groups);
			meta.num_attr_per_group.init(0);		
			for (uint i = 0; i < meta_main.attr_group.dim; i++) {
				meta.attr_group(i) = meta_main.attr_group(i);
				meta.num_attr_per_group(meta.attr_group(i))++;
			}

			uint attr_cntr = meta_main.attr_group.dim;
			uint attr_group_cntr = meta_main.num_attr_groups;
			for (uint r = 0; r < relation.dim; r++) {
				for (uint i = 0; i < relation(r)->meta->attr_group.dim; i++) {
					meta.attr_group(i+attr_cntr) = attr_group_cntr + relation(r)->meta->attr_group(i);
					meta.num_attr_per_group(attr_group_cntr + relation(r)->meta->attr_group(i))++;
				}
				attr_cntr += relation(r)->meta->attr_group.dim;
				attr_group_cntr += relation(r)->meta->num_attr_groups;
			}
	
		}
		meta.num_relations = train.relation.dim;

		// (2) Setup the factorization machine
		fm_model fm;
		{
			fm.num_attribute = num_all_attribute;
            
            //----------------------------------------------------------------------
            fm.init_stdev = param_init_stdev;
            //----------------------------------------------------------------------
            
			// set the number of dimensions in the factorization
			{ 
				std::vector<int> dim = param_dim;
				assert(dim.size() == 3);
				fm.k0 = dim[0] != 0;
				fm.k1 = dim[1] != 0;
				fm.num_factor = dim[2];					
			}			
			fm.init();		
			
		}

		// (3) Setup the learning method:
		fm_learn* fml;

        fm.w.init_normal(fm.init_mean, fm.init_stdev);
        fml = new fm_learn_mcmc_simultaneous();
        fml->validation = validation;
        ((fm_learn_mcmc*)fml)->num_iter = param_num_iter;
        ((fm_learn_mcmc*)fml)->num_eval_cases = test.num_cases;
        ((fm_learn_mcmc*)fml)->do_sample = true;
        ((fm_learn_mcmc*)fml)->do_multilevel = true;

		fml->fm = &fm;
		fml->max_target = train.max_target;
		fml->min_target = train.min_target;
		fml->meta = &meta;
        
        fml->task = 0;//task = r
        
		fml->init();
        {
            //problems remain
            std::vector<double> reg;
            assert((reg.size() == 0) || (reg.size() == 1) || (reg.size() == 3) || (reg.size() == (1+meta.num_attr_groups*2)));
            fm.reg0 = 0.0;
            fm.regw = 0.0;
            fm.regv = 0.0;
            ((fm_learn_mcmc*)fml)->w_lambda.init(fm.regw);
            ((fm_learn_mcmc*)fml)->v_lambda.init(fm.regv);

        }

        fml->learn(train, test);

		// () Prediction at the end  (not for mcmc and als)
        DVector<double> pred;
        pred.setSize(test.num_cases);
        fml->predict(test, pred);
        pred.save(param_out_file);
//		}
				 	

	} catch (std::string &e) {
		std::cerr << std::endl << "ERROR: " << e << std::endl;
	} catch (char const* &e) {
		std::cerr << std::endl << "ERROR: " << e << std::endl;
	}

	system("pause");
}
