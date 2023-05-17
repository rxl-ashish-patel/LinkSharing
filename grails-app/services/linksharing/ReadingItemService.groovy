package linksharing

import grails.gorm.services.Service

class ReadingItemService{
    def create(Map params){
        def readingItem=new ReadingItem(params)
        readingItem.save(flush:true)
        return readingItem
    }
}