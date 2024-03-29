﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL
{
    class SList<T>
    {
        int count = 0;
        Node<T> head = null;
        public void Add(Node<T> cur)
        {
            if (head == null)
            {
                head = cur;
            }
            else
            {
                Node<T> temp;
                temp = head;
                while (temp.next != null)
                {
                    temp = temp.next;
                }
                temp.next = cur;
            }
            count++;
        }
        public void Add(T val)          //Overloaded method
        {
            Node<T> cur = new Node<T>(val);
            if (head == null)
            {
                head = cur;
            }
            else
            {
                Node<T> temp;
                temp = head;
                while (temp.next != null)
                {
                    temp = temp.next;
                }
                temp.next = cur;
            }
            count++;
        }
        public void Display()
        {
            if (head == null)
            {
                Console.WriteLine("LIST IS EMPTY!");
            }
            else
            {
                Console.Write("\nSTART-> ");
                Node<T> temp;
                temp = head;
                while (temp != null)
                {
                    Console.Write(temp.data + " -> ");
                    temp = temp.next;
                }
                Console.Write(" END");
            }
        }
        public int Count        //Property
        {
            get
            {
                return count;
            }

        }
        public T this[int index]        //Indexer
        {
            get
            {
                Node<T> temp;
                temp = head;
                if ((index >= 0) && (index < count))
                {
                    
                    
                    int i = 0;
                    while (i < index)
                    {
                        temp = temp.next;
                        i++;
                    }
                    return temp.data;
                    
                }
                else
                {
                    return temp.data;

                }
            }
        }
        public void InsertAtLast(Node<T> cur)
        {
            if (head == null)
            {
            }
            else
            {
                Node<T> temp;
                temp = head;
                while (temp.next != null)
                {
                    temp = temp.next;
                }
                temp.next = cur;
            }
        }
        public void InsertAtLast(T val)
        {
            Node<T> cur = new Node<T>(val);
            InsertAtLast(cur);
        }
        public void InsertAtFirst(Node<T> cur)
        {
            if (head == null)
            {
                head = cur;
            }
            else
            {
                cur.next = head;
                head = cur;
            }
        }
        public void InsertAtFirst(T val)
        {
            Node<T> cur = new Node<T>(val);
            InsertAtFirst(cur);
        }
        public void InsertAt(Node<T> cur, int pos)
        {
            Node<T> temp = head;
            int i = 1;
            while ((i < pos)&&(temp!=null))
            {
                temp = temp.next;
                i++;
            }
            if (temp == null)
            {
                Console.WriteLine("Insertion Failed! The given position is far beyond number of nodes!");
            }
            else
            {
                cur.next = temp.next;
                temp.next = cur;
            }
        }
        public void InsertAt(T val, int pos)
        {
            Node<T> cur = new Node<T>(val);
            InsertAt(cur, pos);
        }
        public int FindFirst(T data)
        {
            int pos = 1;
            Node<T> temp = head;
            if (head == null)
            {
                return 0;
            }
            else
            {
                Node<T> vamp = new Node<T>(data);
                while (temp != null)
                {
                    if (EqualityComparer<T>.Default.Equals(temp.data, data))
                    {
                        return pos;
                    }
                   
                    temp = temp.next;
                    pos++;
                }
                return 0;
            }
        }
        public int FindLast(T data)
        {
            return 0;
        }
        public void RemoveFirst()
        {
            if (head == null)
            {
            }
            else
            {
                head = head.next;
                
            }
        }
        public void RemoveLast()
        {
            if (head == null)
            {
            }
            else
            {
                Node<T> temp = head;
                if (temp.next == null)
                {
                    head = null;
                }
                else
                {
                    temp = head;
                    while (temp.next.next != null)
                    {
                        temp = temp.next;
                    }
                    temp.next = null;
                }
            }
        }
    }
}
