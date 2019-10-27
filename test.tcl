
package require tdom

set XML "
<order number='1'>
    <customer>John Doe</customer>
    <phone>555-4321</phone>
    <email>jdoe@example.com</email>
    <website/>
    <parts>
        <widget sku='XYZ123' />
        <widget sku='ABC789' />
    </parts>
</order>
"

set doc [ dom parse $XML ]
set root [ $doc documentElement ]
set node [ $root firstChild ]
set node [ $node firstChild ]
#set node [ $node nextSibling ]
#set node [ $node firstChild ]

puts [ $node nodeValue ]





