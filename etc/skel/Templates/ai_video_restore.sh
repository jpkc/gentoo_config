#!/bin/bash

for file in *.mp4
do
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --exp mp4 --face_enhance -s 4 -t 256 -i Animaniacs\ Intro.mp4 -n RealESRGAN_x4plus

#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix RealESRGAN_x4plus-face_enhance -n RealESRGAN_x4plus
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix RealESRNet_x4plus-face_enhance -n RealESRNet_x4plus
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix RealESRGAN_x4plus_anime_6B-face_enhance -n RealESRGAN_x4plus_anime_6B
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix RealESRGAN_x2plus-face_enhance -n RealESRGAN_x2plus
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix realesr-animevideov3-face_enhance -n realesr-animevideov3
#	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4 --face_enhance -i "${file}" --suffix realesr-general-x4v3-face_enhance -n realesr-general-x4v3

	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix RealESRGAN_x4plus -n RealESRGAN_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix RealESRNet_x4plus -n RealESRNet_x4plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix RealESRGAN_x4plus_anime_6B -n RealESRGAN_x4plus_anime_6B
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix RealESRGAN_x2plus -n RealESRGAN_x2plus
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix realesr-animevideov3 -n realesr-animevideov3
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py --ext mp4                -i "${file}" --suffix realesr-general-x4v3 -n realesr-general-x4v3
done

