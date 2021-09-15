using System;
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
        void InsertAtLast(Node<T> cur)
        {
        }
        void InsertAtLast(T val)
        {
        }
        void InsertAtFirst(Node<T> cur)
        {
        }
        void InsertAtFist(T val)
        {
        }
        void InsertAt(Node<T> cur, int pos)
        {
        }
        void InsertAt(T val, int pos)
        {
        }
    }
}
