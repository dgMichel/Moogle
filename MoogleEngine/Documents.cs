namespace MoogleEngine;
using System.IO;
using System.Text.RegularExpressions;
//Clase dedicada a transformar los documentos para ser procesados
public class Documents{
    //Título de los documentos procesados 
    public string title;
    //Este sera un array que contenga todas las palabras de los documentos 
    public string[]text_words;
    //estos serán los valores de TF_IDF de cada documento
    public double score;
    //cantidad de palabras de cada documento
    public int Words_Quantity;
    

    


    public Documents(){
        this.title=title;
        this.text_words=text_words;
        this.score=score;
        this.Words_Quantity=text_words.Length;
    }
}
    