FROM nerfstudio/nerfstudio

WORKDIR /workspace/

RUN git clone --recursive https://github.com/naver/dust3r \
    && cd dust3r \
    && pip install -r requirements.txt \
    && mkdir -p checkpoints/ \
    && wget https://download.europe.naverlabs.com/ComputerVision/DUSt3R/DUSt3R_ViTLarge_BaseDecoder_512_dpt.pth -P checkpoints/

CMD ["python", "dust3r/demo.py", "--weights", "dust3r/checkpoints/DUSt3R_ViTLarge_BaseDecoder_512_dpt.pth", "--local_network"]
