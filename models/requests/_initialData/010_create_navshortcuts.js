module.exports = session => {
    const {
        connection
    } = session
    // In the ubm_desktop table look for the desktop with the code CityReq_desktop
    let desktopID = connection.lookup('ubm_desktop', 'ID', {
        expression: 'code',
        condition: 'equal',
        values: {
            code: 'CityReq_desktop'
        }
    })

    console.info('\tFill `Common dictionary` desktop')
    if (!desktopID) { //If not found, create a new
        console.info('\t\tcreate new `City request` desktop')
        desktopID = connection.insert({
            entity: 'ubm_desktop',
            fieldList: ['ID'],
            execParams: {
                code: 'CityReq_desktop',
                caption: 'City Requests'
            }
        })
    } else { //else display a message
        console.info('\t\tuse existed desktop with code `CityReq_desktop`', desktopID)
    }
}