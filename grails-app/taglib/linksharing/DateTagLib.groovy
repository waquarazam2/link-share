package linksharing

import java.text.SimpleDateFormat

class DateTagLib {
    static defaultEncodeAs = [taglib:'text/html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "date"

    def dateFormate={attr,body->
        out<<new SimpleDateFormat(attr.formate).format(new Date())
        //out<<"<br><div>Amir</div>"
    }
}