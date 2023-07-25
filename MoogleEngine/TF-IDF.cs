namespace MoogleEngine;
using System.IO;
using System.Text.RegularExpressions;

public class TF_IDF{
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