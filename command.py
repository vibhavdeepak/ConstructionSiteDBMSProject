import streamlit as st
import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
     user="root",
     password="root",
     database="dbms_project")

c = mydb.cursor()


def command():
    col1,col2= st.columns(2)

    with col1:
        with st.form(key='query'):
            raw_code=st.text_area("Enter SQL here")
            submit_button = st.form_submit_button(label='Execute')

        with col2:
            if submit_button:
                st.info("Query Submitted")
                st.code(raw_code)
                data=execute(raw_code)
                cols=c.column_names
                with st.expander("Result",expanded=True):
                    query_df=pd.DataFrame(data,columns=cols)
                    st.dataframe(query_df)
                #with st.beta_expander("View Data"):
                   # st.write(data)
                #with st.beta_expander("Prettier"):
                   # query_df=pd.DataFrame(data)
                   # st.dataframe(query_df)
        '''with col3:
            if st.button("Function to Call Labourers whos salary is less than 100"):
                data=execute("SELECT * FROM budget WHERE Labourers_Sal<1000")
                cols=c.column_names
                with st.expander("Result",expanded=True):
                    query_df=pd.DataFrame(data,columns=cols)
                    st.dataframe(query_df)'''
        '''with col4:
            if st.button("Budge Lab"):
                data=execute("Call BUDGE_LAB()")
                cols=c.column_names
            with st.expander("Result",expanded=True):
                query_df=pd.DataFrame(data,columns=cols)
                st.dataframe(query_df)'''
        '''with col5:
            if st.button("Function"):
                data=execute("select nf(title_type) from construction_site;")
                cols=c.column_names
            with st.expander("Result",expanded=True):
                query_df=pd.DataFrame(data,columns=cols)
                st.dataframe(query_df)'''




def execute(raw_code):
    c.execute(raw_code)
    data=c.fetchall()
    return data




if __name__=="command":
    command()