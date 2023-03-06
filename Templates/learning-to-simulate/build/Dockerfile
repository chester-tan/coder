FROM tensorflow/tensorflow:1.15.5-gpu-py3-jupyter

RUN pip install -U pip

RUN pip install \
	"absl-py" \
	"graph-nets>=1.1" \
	"tensorflow-gpu>=1.15,<2" \
	"numpy" \
	"dm-sonnet<2" \
	"tensorflow_probability<0.9" \
	"sklearn" \
	"dm-tree" \
	"matplotlib"
