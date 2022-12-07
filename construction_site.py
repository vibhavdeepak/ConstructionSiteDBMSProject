import mysql.connector
import streamlit as st
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")

c = mydb.cursor()

def construction_site():
    tab1,tab2,tab3,tab4=st.tabs(["Create","Read","Update","Delete"])

    with tab1:
        col1,col2,col3=st.columns(3)
        with col1:
            new_site_id=st.text_input("Site ID")
            new_site_plot=st.text_input("Site Plot Size")
            new_site_city=st.text_input("City")
        with col2:
            new_site_location=st.text_input("Site Location")
            new_site_title_type=st.text_input("Site Title Type")
        with col3:
            new_site_Fname=st.text_input("Site Owner First Name")
            new_site_Lname=st.text_input("Site Owner Last Name")
        if st.button("Add Construction Site Details"):
            add_construction_site(new_site_id,new_site_plot,new_site_city,new_site_location,new_site_title_type,new_site_Fname,new_site_Lname)
            st.success("Successfully added construction site details")
    with tab2:
        with st.form(key='construction_site_read'):
            site_id=st.text_input("Enter Site ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_construction_site(site_id)
        df=pd.DataFrame(result,columns=['Site ID','Site Plot Size','City','Site Location','Site Title Type','Site Owner First Name','Site Owner Last Name'])
        st.dataframe(df)
    with tab3:
        with st.form(key='construction_site_update'):
            site_id=st.text_input("Enter Site ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_construction_site(site_id)
        df=pd.DataFrame(result,columns=['Site ID','Site Plot Size','City','Site Location','Site Title Type','Site Owner First Name','Site Owner Last Name'])
        st.dataframe(df)
        if result:
            cons_title_type=result[0][4]
            new_cons_title_type=st.text_input("Enter new Site Title Type",cons_title_type)
            cons_Fname=result[0][5]
            new_cons_Fname=st.text_input("Enter new Site Owner First Name",cons_Fname)
            cons_Lname=result[0][6]
            new_cons_Lname=st.text_input("Enter new Site Owner Last Name",cons_Lname)
            if st.button("Update Construction Site Details"):
                c.execute("UPDATE construction_site SET Title_Type=%s,Fname=%s,Lname=%s WHERE Site_ID=%s",(new_cons_title_type,new_cons_Fname,new_cons_Lname,site_id))
                mydb.commit()
                st.success("Successfully updated construction site details")
    with tab4:
        with st.form(key='construction_site_delete'):
            site_id=st.text_input("Enter Site ID")
            submit_button=st.form_submit_button(label='Submit')
        result=view_all_data_construction_site(site_id)
        df=pd.DataFrame(result,columns=['Site ID','Site Plot Size','City','Site Location','Site Title Type','Site Owner First Name','Site Owner Last Name'])
        st.dataframe(df)
        if result:
            if st.button("Delete Construction Site Details"):
                c.execute("DELETE FROM construction_site WHERE Site_ID=%s",(site_id,))
                mydb.commit()
                st.success("Successfully deleted construction site details")
    



def view_all_data_construction_site(site_id):
    c.execute("SELECT * FROM construction_site WHERE Site_ID=%s",(site_id,))
    result=c.fetchall()
    return result


def add_construction_site(new_site_id,new_site_plot,new_site_city,new_site_location,new_site_title_type,new_site_Fname,new_site_Lname):
    c.execute("INSERT INTO construction_site(Site_ID,Plot_Size,City,Location,Title_Type,Fname,Lname) VALUES(%s,%s,%s,%s,%s,%s,%s)",(new_site_id,new_site_plot,new_site_city,new_site_location,new_site_title_type,new_site_Fname,new_site_Lname))
    mydb.commit()

if __name__=="construction_site":
    construction_site()