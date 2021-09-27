<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class palindromeController extends Controller
{
    //

    public function checkString(Request $request){
        // dd($request->all());
        if($request->word){
            if(strrev($request->word) == $request->word){
                return "is a Palindrome word";
            }
            return "is not a palindrome word";

        }else{
            return "Enter a word";
        }
    }



public function sendString(){
    // dd($request->all());
    // if(strrev($request->word) == $request->word){
    //     return "String is Palindrome";
    // }
    return "Your string is not a palindrome";
}
}