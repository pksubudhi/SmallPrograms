using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL
{
    class SList<T>
    {
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
        }
        public void Add(T val)
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
    }
}
