

#include <string>

using namespace std;

class JSONValue;

class Predicate {

public:
    virtual bool eval(const JSONValue& msg) const =0;
};

class P_AND : public Predicate {

};

class Value {};

class Field : public Value {
    const string _n;
public:
    Field(const string& n) : _n(n) {}     
};

class BitField : public Value {
    const int _ofs;
public:
    Field(const int ofs) : _ofs(ofs) {}

    int get(const JSONValue&);
};

Field msgType() {
    return Field("msgType");
}

Field field(const string& nm) { return Field(nm); }
BitField field(int ofs) { return BitField(ofs); }

Predicate operator==(const Value&, const Value&) const;

Predicate operator==(const Value&, const string&) const;

Predicate operator==(const Value&, const int) const;

Predicate operator&&(const Predicate& const Predicate&);


class SequenceNumber {
};


bool check(string itf, Predicate p);


void test1() {

    const string HMI1 = "HMI";
    const string RBC="RBC";
    const string FEC="FEC";

    SequenceNumber X;

    check(HMI1, (field(12) == 0x0) && (field(80+3) == 0x4) );

    check_all(RBC,
        msgType()=="SSR" && field("RFA")=="1",
        msgType()=="XXX" && field("RFA")=="0");

    check_any(RBC,
        msgType()=="SSR" && field("RFA")=="1",
        msgType()=="XXX" && field("RFA")=="0");

    check(FEC, belongs(field("aspect"), {"green_fl", "green"}) 
        && field("SequenceNbr")== X );
}




int main() {

}
