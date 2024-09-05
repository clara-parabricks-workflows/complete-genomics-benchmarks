#!/bin/bash 

# pip install tensorflow
# pip install -U tf2onnx

python -m tf2onnx.convert \
	--checkpoint data/deepvariant_models/weights-51-0.995354.ckpt.data-00000-of-00001  \
	--output model.onnx \
	--inputs input0:0,input1:0 \
	--outputs output0:0
