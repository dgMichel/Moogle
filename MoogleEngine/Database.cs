namespace MoogleEngine;
using System.IO;
using System.Text.RegularExpressions;
using System.Linq;
//clase dedicada a crear la base de datos con la información de los documentos a ser procesados
public class Database{
    //Lista que almacenara todos los objetos de la clase documents
    public List<Documents> All_Documents;
    
    public Database(){
       string[] Locations = Directory.GetFiles(@"C:\DAVID\Program\Proyectom\moogle-main\Content", "*txt");
       for(int i =0;i<Locations.Length;i++){
        //cosa nueva
       string title=Get_Title(Locations[i]);
       string [] text_words= Split_Text(Locations[i]);
    

       
       }
       
    }
    //función para obtener los títulos de los documentos
    static string Get_Title(string Location){
        string title = Location.Substring(46,Location.Length-50);
        return title; 
    }
    //Función que analizará el contenido de los documentos y los separará por palabras 
    static string[] Split_Text(string Location){
        string text = File.ReadAllText(Location);
        text = text.ToLower();
        string [] splitted_text = Regex.Split(text, @"\W+");
        return splitted_text;
    }

    //Función que calculará los valores del TF_IDF 
    public double TF (string term, string [] words){
        int size= words.Length;
        int count=0;
        for(int i=0;i<words.Length;i++){
            if(words[i]==term){
                count++;
            }
        }
        return count/size;
        
    }

    

}