import streamlit as st

def hello_word():
    return "Olá Mundo"

def main():
    st.write(hello_word())

if __name__ == "__main__":
    main()