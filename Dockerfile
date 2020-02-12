FROM python:3.7.6-slim-stretch

# Keep requirements and pip install separate so that this layer is cached separately from the other files below
COPY requirements.txt /
RUN python3 -m pip install -r /requirements.txt

COPY image_upload_5.py model_image_matching.py gen_html.py file_upload_form.html encoder.h5 encoded_data.dat encoded_files.txt /
COPY images /images/

RUN mkdir -p /uploads

EXPOSE 8080

CMD ["python", "./image_upload_5.py"]
