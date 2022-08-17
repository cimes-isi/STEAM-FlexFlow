# model arguments suggested by Frank.
# Frank also suggested increasing the number of embedding tables (replicate the -10000000 in --arch-embedding-size)
# this script is not tested, yet.
# get profile data
# it produces a file named measure_<batchsize>_<nsimnode>.json
./dlrmsim -ll:gpu 1 -ll:cpu 1 -ll:zsize 20000 -ll:fsize 10000 -ll:util 4  -dm:memoize --embedding-bag-size 100 --arch-sparse-feature-size 128 --arch-embedding-size 10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000 --arch-mlp-bot 2048-2048-2048-2048-2048-2048-2048-2048 --arch-mlp-top 4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-1  --search-budget 1 --node-bandwidth 100 --inter-gpu-bandwidth 200 --gpu-dram-bandwidth 256 --network-latency 1 --net-opt 1 --batch-size 524288 --nsimnode 1024 --big-gpu 4 --simulator-workspace-size 38654705664 --measure

# get a (near) optimal parallelization: 
./DLRMsim/dlrmsim -ll:gpu 1 -ll:cpu 1 -ll:zsize 20000 -ll:fsize 10000 -ll:util 4 -dm:memoize --embedding-bag-size 100 --arch-sparse-feature-size 128 --arch-embedding-size 10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000-10000000 --arch-mlp-bot 2048-2048-2048-2048-2048-2048-2048-2048 --arch-mlp-top 4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-4096-1  
--batch-size 524288 --inter-gpu-bandwidth 200 --gpu-dram-bandwidth 256 --network-latency 1 --net-opt 1 --search-budget 4000 --enable-propagation --simulator-workspace-size 65536 --big-gpu 4  --mfile measures/dlrm128.json --taskgraph tg.topoopt.400G.dlrm128.nd12 --node-degree 4 --interface-bandwidth 400 --nsimnode 1024 --topology topoopt

