using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL
{
    class Node<T>
    {
        public T data;
        public Node<T> next;
        public Node()
        {
           
            next = null;
        }
        public Node(T n)
        {
            data = n;
            next = null;
        }
    }
}
