# DBMS 
**Data model** : It is the concept of tools which are developed to describes the structure of the database , operations and constraints on the data in database.
<br>
**Database Schema :**
A schema is a blueprint or structure that defines how the database is organized. It typically includes definitions for tables, columns, data types, relationships, and constraints.
<br>

By **structure of a database** we mean the data types, relationships,and constraints that apply to the data.
<br>
**valid state** : It is a state that satisfy the constraints and structure of the database.
<br>
**intial database state**: Data stored at first time into the system.
<br>
schema is also called **intension**.
<br>
state is also called **extension**.
<br>
**Degree of Relationship** is the no of entities in the relationship.It is mostly binary . It can be unary , ternary and more.
<br>
**Relationship Set** is a set of relationships of same type.
ex=> Teacher Set mentors the students set. Here from teacher set, every teachers mentors the many students . like (teacher1 -> m1 -> student1 , teacher1 -> m2 -> s2). Here the set of the {m1, m2 ,---} are relationships of same type . This is called as relationships sets.
<br>
**Recursive Relationship** It is a relationships between same entity. In this relationship on one end entity plays one role and on the other end it plays another role and this roles ara known as **rollnames**
<br>
**Participation:** There are two types of participation . **(1) Total Participation :** when all entities of an entity type have at least one participation instance in a relationship set . It is represented by double line while showing the relationship. It is also called as existence dependency.
<br>

**(2) Partial Participation :** Partial participation allows entities of an entity type to optionally participate in a relationship set. It is represented by single line while showing the relationship.


**Partial Key** There is atleast an attribute in the weak attrubute which acts as a primary key which is called Partial key. It is represented by dashed line in the oval .
