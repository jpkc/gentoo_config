#!/bin/bash

for file in *
do
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix RealESRGAN_x4plus-face_enhance -n RealESRGAN_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix RealESRNet_x4plus-face_enhance -n RealESRNet_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix RealESRGAN_x4plus_anime_6B-face_enhance -n RealESRGAN_x4plus_anime_6B
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix RealESRGAN_x2plus-face_enhance -n RealESRGAN_x2plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix realesr-animevideov3-face_enhance -n realesr-animevideov3
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg --face_enhance -t 256 -i "${file}" --suffix realesr-general-x4v3-face_enhance -n realesr-general-x4v3

	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix RealESRGAN_x4plus -n RealESRGAN_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix RealESRNet_x4plus -n RealESRNet_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix RealESRGAN_x4plus_anime_6B -n RealESRGAN_x4plus_anime_6B
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix RealESRGAN_x2plus -n RealESRGAN_x2plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix realesr-animevideov3 -n realesr-animevideov3
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan.py --ext jpg                -t 256 -i "${file}" --suffix realesr-general-x4v3 -n realesr-general-x4v3
done

