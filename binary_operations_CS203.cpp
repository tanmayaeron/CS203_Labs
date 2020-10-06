#include<bits/stdc++.h>
using namespace std;

int N;

void NBitSubtraction(char* A, char *B, char CIN, char* Sum, char &COUT);

void BitAddition(char A,char B,char CIN,char &Sum, char &COUT)
{
    int a = A-'0';
    int b = B-'0';
    int c = CIN-'0';
    if(a+b+c==3)
    {
        Sum='1';
        COUT='1';
    }
    else if(a+b+c==2)
    {
        Sum='0';
        COUT='1';
    }
    else if(a+b+c==1)
    {
       Sum='1';
       COUT='0';
    }
    else
    {
        Sum='0';
        COUT='0';
    }
}

void NBitAddition(char* A, char *B, char CIN, char* Sum, char &COUT)
{
    for(int i=N-1;i>=0;i--)
    {
        BitAddition(A[i],B[i],CIN,Sum[i],COUT);
        CIN=COUT;
    }
}

void Inverse(char* A, char* B)
{
    for(int i=0;i<N;i++)
    {
        if(A[i]=='0')
        B[i]='1';
        else
        B[i]='0';
    }
}

void TwoSCompliment(char* A, char *B)
{
    Inverse(A,B);
    char temp[N];
    for(int i=0;i<N-1;i++)
    temp[i]='0';
    temp[N-1]='1';
    char COUT;
    NBitAddition(B,temp,'0',B,COUT);
}

bool isOverflow(char* A, char* B, char* Sum, char COUT, int operation)
{
    if(operation==0)
    {
        NBitAddition(A,B,'0',Sum,COUT);
        if((A[0]=='0')&&(B[0]=='0'))
        {
            if(Sum[0]=='1')
            return true;
            return false;
        }
        else if(A[0]=='1'&&B[0]=='1')
        {
            if(Sum[0]=='0')
            return true;
            return false;
        }
        else
        return false;
    }
    else
    {
        char C[N];
        for(int i=0;i<N;i++)
        C[i]=B[i];
        NBitSubtraction(A,C,'0',Sum,COUT);
        if(A[0]=='0'&&B[0]=='0')
        return false;
        if(A[0]=='1'&&B[0]=='1')
        return false;
        if(A[0]=='1'&&B[0]=='0')
        {
            if(Sum[0]=='0')
            return true;
            return false;
        }
        int i;
        for(i=0;i<N;i++)
        {
            if(Sum[i]=='1')
            break;
        }
        if(i==N)               // deal with 0-(-8) should give overflow
        return true;
        if(Sum[0]=='1')
        return true;
        return false;
    }
}

void NBitSubtraction(char* A, char *B, char CIN, char* Sum, char &COUT)
{
    if(CIN=='0')
    {
        TwoSCompliment(B,B);
        NBitAddition(A,B,'0',Sum,COUT);
    }
    else
    {
        Inverse(B,B);
        NBitAddition(A,B,'0',Sum,COUT);
    }
}

int main()
{
    scanf("%d",&N);
    char a,b,CIN;
    scanf(" %c %c %c",&a,&b,&CIN);
    char Sum,COUT;
    BitAddition(a,b,CIN,Sum,COUT);
    cout<<Sum<<" "<<COUT;
    char A[N],B[N],sum[N];
    for(int i=0;i<N;i++)
    scanf(" %c",&A[i]);
    for(int i=0;i<N;i++)
    scanf(" %c",&B[i]);
    scanf(" %c",&CIN);
    NBitAddition(A,B,CIN,sum,COUT);
    for(int i=0;i<N;i++)
    printf("%c",sum[i]);
    printf(" %c\n",COUT);
    for(int i=0;i<N;i++)
    scanf(" %c",&A[i]);
    Inverse(A,B);
    for(int i=0;i<N;i++)
    printf("%c",B[i]);
    printf("\n");
    for(int i=0;i<N;i++)
    scanf(" %c",&A[i]);
    TwoSCompliment(A,B);
    for(int i=0;i<N;i++)
    printf("%c",B[i]);
    printf("\n");
    for(int i=0;i<N;i++)
    scanf(" %c",&A[i]);
    for(int i=0;i<N;i++)
    scanf(" %c",&B[i]);
    int operation;
    scanf(" %d",&operation);
    //if(operation==0)
    //NBitAddition(A,B,'0',sum,COUT);
    //else
    //NBitSubtraction(A,B,'0',sum,COUT);
    bool result=isOverflow(A,B,sum,COUT,operation);
    cout<<result<<endl;
    for(int i=0;i<N;i++)
    scanf(" %c",&A[i]);
    for(int i=0;i<N;i++)
    scanf(" %c",&B[i]);
    scanf(" %c",&CIN);
    NBitSubtraction(A,B,CIN,sum,COUT);
    for(int i=0;i<N;i++)
    printf("%c",sum[i]);
    printf(" %c",COUT);
}
