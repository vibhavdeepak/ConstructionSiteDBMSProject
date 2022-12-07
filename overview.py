import mysql.connector
from PIL import Image 
import streamlit as st


def overview():
    #st.subheader("Welcome to the Construction Site Database Management System Project")
    image = Image.open('dbms_bg.jpg')
    st.image(image,caption='Construction Site Database Managment System')
    st.subheader("Construction Site DBMS")
    st.caption("Project Developed by: Vibhav Deepak")
    st.caption("SRN: PES1UG20CS496")
    st.caption("Section: I")
    st.caption("Teacher: The amazing Nagasundari Ma'am")



if __name__=="overview":
    overview()