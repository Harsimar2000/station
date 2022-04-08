#include "myglobalobject.h"
#include <QDebug>
#include <QOperatingSystemVersion>
#include <typeinfo>

MyGlobalObject::MyGlobalObject() : m_counter(0)
{

}

void MyGlobalObject::doSomething(const QString &text) {
 qDebug() << "MyGlobalObject doSomething called with" << text;
}

int MyGlobalObject::counter() const {

    QOperatingSystemVersion operatingSystem = QOperatingSystemVersion::current();
    qDebug()<< operatingSystem << Qt::endl;
    QOperatingSystemVersion::OSType a = QOperatingSystemVersion::currentType();
    qDebug()<< "Operating System Code = " << a << Qt::endl;

    return a;
}


void MyGlobalObject::setCounter(int value) {
 if(m_counter != value) {
   m_counter = value;
   counterChanged(); // trigger signal of counter change
 }
}
