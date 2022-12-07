import streamlit as st
import mysql.connector
from construction_site import construction_site
from budget import budget
from architect import architect
from overview import overview
from labourer import labourer
from contractor import contractor
from command import command

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")

c = mydb.cursor()




def main():
    st.title("Final DBMS Mini Project")
    menu = ["Landing Page","Construction Site","Budget","Architect","Labourer","Contractor","Command"]
    choice=st.sidebar.selectbox("Menu",menu)
    if choice == "Landing Page":
        overview()

    if choice == "Construction Site":
        st.subheader("Welcome to the Construction Site Dashboard")
        construction_site()

    elif choice == "Budget":
        st.subheader("View Budget Details:")
        budget()

    elif choice == "Architect":
        st.subheader("View Architect Details:")
        architect()

    elif choice == "Labourer":
        st.subheader("View Labourer Details:")
        labourer()

    elif choice == "Contractor":
        st.subheader("View Contractor Details:")
        contractor()
    elif choice == "Command":
        st.subheader("Enter Command:")
        command()


if __name__ == '__main__':
    main()