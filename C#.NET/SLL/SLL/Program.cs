﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL
{
    class Program
    {
        static void Main(string[] args)
        {
            SList<int> lst = new SList<int>();

            lst.Add(new Node<int>(50));
            lst.Add(new Node<int>(42));
            lst.Add(new Node<int>(69));
            Console.Write("\nInteger List is: ");
            lst.Display();

            SList<string> slst = new SList<string>();
            slst.Add(new Node<string>("Data"));
            slst.Add(new Node<string>("Structure"));
            slst.Add(new Node<string>("is"));
            slst.Add(new Node<string>("a"));
            slst.Add(new Node<string>("nice"));
            slst.Add(new Node<string>("Subject."));
            Console.Write("\nString List is: ");
            slst.Display();
            Console.Write("\nFurther modified String List is: ");
            slst.Add("I");
            slst.Add("Can");
            slst.Add("add");
            slst.Add("like");
            slst.Add("This.");
            slst.Display();
            slst.InsertAt("Content", 9);
            slst.Display();
            Console.WriteLine("\nIn slst: Element is at " + slst.FindFirst("add"));
            Console.WriteLine("\nIn lst: Element is at " + lst.FindFirst(42));
            Console.WriteLine("\nTotal number of node is " + slst.Count);
            Console.WriteLine("\nFourth Element is " + slst[3].ToString());
            slst.RemoveFirst();
            slst.Display();
            Console.WriteLine("\nNow Total number of node remained in slst is " + slst.Count);
            lst.RemoveLast();
            lst.Display();
            Console.WriteLine("\nNow Total number of node remained in lst is " + lst.Count);
            Console.ReadKey();
        }
    }
}
