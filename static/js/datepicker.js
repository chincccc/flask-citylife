/**
 * @author lizz
 * 
 * @description 不知道什么时候开始写，因为懒。兼容性 >= IE10；（用到了classList）
 *              IE8，拜拜！
 * 
 * create at 2018-08-20
 * start at 2018-08-27
 * 单个日期选择切换等功能 complete at 2018-08-30
 * 日期范围选择切换等功能 complete at 忘了
 * 日期范围点击选中日期并改变样式以及切换年月点击选中日期等功能 complete at 2018-09-11 PS:懒得一笔
 * 最终完成(样式优化等) complete at 不知道
 * 
 */

 class DatePicker {
     /**
      * @param {*} dom 日期选择“总父级”节点标签
      * @param {*} double 控制日期选择单个日期还是范围
      *                   true: 选择日期范围。出现两个日期面板
      *                   false: 选择单个日期。单个日期面板
      * @param {*} i 由于 bindEvent 方法中之前通过写死id来实现一些功能，一旦页面上用到多个日期选择就会出bug，所以给id后面加上i用来区分。i自己定值，避免重复
      * @param {*} callback 回调函数。默认参数是被选中的日期
      */
     constructor (body, dom, double, i, callback) {
        this.init(body, dom, double, i, callback)
     };

     init (body, dom, double, i, callback) {
        this.double = double || false
        this.i = i
        this.callback = callback || function(){}
        this.current = new Date()
        // 由于多处需要保存new Date()，所以建一个公共变量，但是一次只能有一处改变它；
        this.publicCurrent = new Date()
        this.timeYear = this.current.getFullYear()
        this.timeMonth = this.current.getMonth()
        this.timeDate = this.current.getDate()
        this.timeWeek = this.current.getDay()
        this.monthDays = this.getMonthDays(this.timeYear, this.timeMonth)
        // 状态管理，切换年月时跟着变化。
        let nextTime = new Date()
        nextTime.setMonth(this.timeMonth + 1)
        this.state = {
            time: new Date(),
            year: this.timeYear,
            month: this.timeMonth,
            date: this.timeDate,
            nextTime: nextTime,
            nextMonth: this.timeMonth + 1,
            nextYear: nextTime.getFullYear(),
            nextDate: nextTime.getDate(),
        }
        this.inputVal = [] // 保存 input 输入框的值可能是单个日期也可能是两个日期(日期范围)，值为string类型。最终赋值给日期输入框
        this.cacheValue = '' // 缓存日期输入框的值，在日期范围模式下切换年月有用
        this.inputValNum = [] // 保存将 '2018-08-30'分割成数组后的Number类型值 [2018, 8, 30]
        this.weeks = ['日', '一', '二', '三', '四', '五', '六'],
        this.selectedCount = 0 // 用于计算被选中日期数量，达到3设为0
        this.render(body, dom)
     };

     render (body, dom) {
        this.dateInput()
        this.datePanel()
        this.changeDom(dom)
        this.bindEvent(body, dom)
     };

     /**
      * @param {*} dom 日期选择“总父级”节点标签
      * @description 日期选择内部布局
      */
     changeDom (dom) {
        this.dateInput()
        dom.innerHTML = this.dateInputDom + this.date
     };

     /**
      * @description 日期选择输入框
      */
     dateInput () {
        this.dateInputDom = `<div class="date-picker-rel date-picker-type">
                            <div class="date-input-wrapper date-picker-type">
                                <i class="date-input-icon iconfont date-picker-type"></i>
                                <input value="${!this.double ? 
                                        this.inputVal.length === 1 ? 
                                        this.inputVal[0] : '' 
                                        : this.inputVal.length === 2 ? 
                                            this.inputVal[0] + ' - ' + this.inputVal[1] : 
                                                this.inputVal.length === 1 ? this.cacheValue : ''}" 
                                        autocomplete="off" spellcheck="false" type="text" placeholder="请选择日期" 
                                            class="date-picker-input date-picker-type" id="date-picker-input${this.i}">
                            </div>
                        </div>`
     };

     datePanel (isHide=true) {
        this.date = `<div class="date-picker-select-dropdown ${isHide === true ? 'date-picker-select-dropdown-hide' : ''} date-picker-type" id="date-picker-select${this.i}">
                        <div class="date-picker-type">
                            <div class="date-picker-type ${this.double === true ? 'date-picker-with-range date-picker-panel-body-wrapper' : ''}">
                                ${this.time()}
                            </div>
                        </div>
                    </div>`
     };

     /**
      * @description 一开始`<div>
      *                      <span></span>
      *                      <span></span>
      *                      <span></span>
      *                      <span></span>
      *                      <span></span>
      *                      <span></span>
      *                      <span></span>
      *                    </div>`
      *             div宽度196px，每个span宽24px，margin 2px，按理来说应该正好占满一行，
      *             但是页面上显示最后一个span被挤到了第二行，但是span宽度，margin并没有变，
      *             也没有多余的border和padding，div也没有border和padding，
      *             调试时发现第一个span没有紧贴着div左边，反而有间距似的，
      *             百思不得其解，后来突发奇想，猜测是不是换行导致的问题，遂将span写到一行，果然解决了！！！
      *
      */
     time () {
        let timePanel =  `<div class="date-picker-panel-body date-picker-type">`
        if (this.double === true) {
            timePanel += `${this.timeItem(this.state.year, this.state.month)}</div></div></div>${this.timeItem(this.state.nextYear, this.state.nextMonth, true)}</div></div></div></div>`
        } else {
            timePanel += `${this.timeItem(this.state.year, this.state.month)}</div></div></div></div>`
        }

        return timePanel     
     };

     /**
      * @description 日期范围选择其实就是两个日期选择面板，所以把日期面板抽出来复用
      * @param {*} y 传入的year
      * @param {*} m 传入的month，需要加 1
      * @param {*} rangeRight 为了方便区别 选择日期范围时的左右面板，当切换 上/下月、年 时方便区分
      */
     timeItem (y, m, rangeRight) {
        let timePanelItem = `<div class="${this.double === true ? 'date-picker-panel-content date-picker-panel-content-left' : ''}">
                            <div class="date-picker-header date-picker-type">
                                <span class="date-picker-panel-icon-btn date-picker-prev-btn date-picker-prev-btn-arrow-double date-picker-type 
                                ${rangeRight === true ? 'date-picker-range-right' : ''}">
                                    <i class="icon-double-arrow-left iconfont date-picker-type ${rangeRight === true ? 'date-picker-range-right' : ''}" style="font-size: 12px;"></i>
                                </span>
                                <span class="date-picker-panel-icon-btn date-picker-prev-btn date-picker-prev-btn-arrow date-picker-type
                                ${rangeRight === true ? 'date-picker-range-right' : ''}">
                                    <i class="icon-jiantouarrowhead7 iconfont date-picker-type ${rangeRight === true ? 'date-picker-range-right' : ''}"></i>
                                </span>
                                <span class="date-picker-type">
                                    <span class="date-picker-header-label date-picker-type">${y}年</span>
                                    <span class="date-picker-header-label date-picker-type">${m + 1}月</span>
                                </span>
                                <span class="date-picker-panel-icon-btn date-picker-next-btn date-picker-next-btn-arrow-double date-picker-type
                                ${rangeRight === true ? 'date-picker-range-right' : ''}">
                                    <i class="icon-double-arrow-right iconfont date-picker-type ${rangeRight === true ? 'date-picker-range-right' : ''}" style="font-size: 12px;"></i>
                                </span>
                                <span class="date-picker-panel-icon-btn date-picker-next-btn date-picker-next-btn-arrow date-picker-type
                                ${rangeRight === true ? 'date-picker-range-right' : ''}">
                                    <i class="icon-jiantouarrow487 iconfont date-picker-type ${rangeRight === true ? 'date-picker-range-right' : ''}"></i>
                                </span>
                            </div>
                            <div class="${this.double === true ? '' : 'date-picker-panel-content'} date-picker-type">
                                <div class="date-picker-cells date-picker-type">
                                    <div class="date-picker-cells-header date-picker-type">`
        for (let i = 0; i < this.weeks.length; i++) {
            timePanelItem += `<span class="date-picker-type date-picker-week">${this.weeks[i]}</span>`
        }
        timePanelItem += `</div>`
        let allDaysArr = this.getAllDays(y, m)
        for (let i = 0; i < allDaysArr.length; i++) {
            // 上月的日期置灰
            if (i < allDaysArr.indexOf(1)) {
                timePanelItem += `<span class="date-picker-cells-cell date-picker-type date-picker-cells-cell-prev-month date-picker-disable"><em class="date-picker-type date-picker-disable">${allDaysArr[i]}</em></span>`
                continue
            }
            // 下月的日期置灰，从这个月1号开始查找，避免找到上个月最后一天的下标
            if (i > allDaysArr.indexOf(this.getMonthDays(y, m), allDaysArr.indexOf(1))) {
                timePanelItem += `<span class="date-picker-cells-cell date-picker-type date-picker-cells-cell-next-month date-picker-disable"><em class="date-picker-type date-picker-disable">${allDaysArr[i]}</em></span>`
                continue
            }
            if (this.timeDate === allDaysArr[i] && this.timeMonth === m && this.timeYear === y) {
                timePanelItem += `<span class="date-picker-cells-cell date-picker-type date-picker-cells-cell-today
                    ${(this.inputValNum[0] === y 
                        && this.inputValNum[1] === m + 1 
                        && this.inputValNum[2] === allDaysArr[i]) || 
                        (this.inputValNum[3] === y 
                            && this.inputValNum[4] === m + 1 
                            && this.inputValNum[5] === allDaysArr[i])? 'date-picker-cells-cell-selected date-picker-cells-focused' : ''}
                                "><em class="date-picker-type">${allDaysArr[i]}</em></span>`
                continue
            }
            // 这里做个判断，当切换月份或者年份后再返回之前被选中的日期时，被选中的日期样式保留被选中状态
            timePanelItem += `<span class="date-picker-cells-cell date-picker-type 
                            ${(this.inputValNum[0] === y 
                                && this.inputValNum[1] === m + 1 
                                && this.inputValNum[2] === allDaysArr[i]) || 
                                (this.inputValNum[3] === y 
                                    && this.inputValNum[4] === m + 1 
                                    && this.inputValNum[5] === allDaysArr[i])? 'date-picker-cells-cell-selected date-picker-cells-focused' : ''}">
                                <em class="date-picker-type">${allDaysArr[i]}</em></span>`
        }
        return timePanelItem
     }

     /**
      * @description 获取日期所在月份的所有天数
      */
     getMonthDays (timeYear, timeMonth) {
        this.publicCurrent = new Date(timeYear, timeMonth)
        this.publicCurrent.setMonth(timeMonth + 1)
        this.publicCurrent.setDate(0)
        return this.publicCurrent.getDate()
     };

     /**
      * @description 获取日期所在月份的1号对应周几。PS：这里返回值对应thisw.weeks数组的下标
      */
     getFirstDayWeek (timeYear, timeMonth) {
        this.publicCurrent = new Date(timeYear, timeMonth)
        this.publicCurrent.setDate(1)
        return this.publicCurrent.getDay()
     }

     /**
      * 
      * @param {*} timeYear 
      * @param {*} timeMonth 
      * 
      * @description 获取日期所在月份的最后一天对应周几。PS：这里返回值对应thisw.weeks数组的下标
      */
     getLastDayWeek (timeYear, timeMonth) {
        let current = new Date(timeYear, timeMonth)
        current.setDate(this.getMonthDays(timeYear, timeMonth))
        return current.getDay()
     }

     /**
      * @description 获取当前面板所有需要展示的日期。PS：是数组
      */
     getAllDays (timeYear, timeMonth) {
        let current = new Date(timeYear, timeMonth)
        let allDaysArr = []
        for (let i = 1; i < this.getMonthDays(timeYear, timeMonth) + 1; i++) {
            allDaysArr.push(i)
        }
        current.setDate(0)
        let prevMonthDays = current.getDate()
        current = null
        for (let i = 0; i < this.getFirstDayWeek(timeYear, timeMonth); i++) {
            allDaysArr.unshift(prevMonthDays - i)
        }
        let len = allDaysArr.length
        // 42 -- 日期面板只展示42个日期
        for (let i = 1; i < 42 - len + 1; i++) {
            allDaysArr.push(i)
        }
        return allDaysArr
     }

     /**
      * @param {*} dom 日期选择“总父级”节点标签
      * @description 日期选择中的事件绑定
      * 
      * 踩坑：由于当点击左右切换箭头时改变了原有的 DOM，如果 datePickerPanel 在事件绑定之前就定义好，
      *       那么保存的是一开始的 DOM而不是更改后的。将无法控制显隐。
      */
     bindEvent (body, dom) {
        let me = this
        var datePickerPanel
        var datePickerInput
        body.addEventListener('click', function (e) {
            datePickerPanel = document.getElementById(`date-picker-select${me.i}`)
            datePickerInput = document.getElementById(`date-picker-input${me.i}`)
            if (!e.target.classList.contains('date-picker-type')) {
                datePickerPanel.classList.add('date-picker-select-dropdown-hide')
            }
        })
        dom.addEventListener('click', function (e) {
            console.log(e)
            datePickerPanel = document.getElementById(`date-picker-select${me.i}`)
            datePickerInput = document.getElementById(`date-picker-input${me.i}`)
            // 控制日期下拉面板显隐
            if (datePickerPanel.classList.contains('date-picker-select-dropdown-hide')) {
                datePickerPanel.classList.remove('date-picker-select-dropdown-hide')
                // datePickerPanel.classList.add('date-picker-select-dropdown-animation-fadein')
            }
            // 切换下一月
            if (e.target.classList.contains('date-picker-next-btn-arrow') || e.target.parentNode.classList.contains('date-picker-next-btn-arrow')) {
                // 日期范围模式下，有两个面板，切换右侧面板下一月不影响左侧面板
                if (e.target.classList.contains('date-picker-range-right') || e.target.parentNode.classList.contains('date-picker-range-right')) {
                    me.resetState(true, 0, 2, 1)
                    me.dateInput()
                    me.datePanel(false)
                    me.changeDom(dom)
                    return
                }
                me.resetState(false, 0, 0, 1)
                // 日期范围模式下，有两个面板，切换左侧面板，至少保证右侧面板日期比左侧大一个月
                if (me.state.month === me.state.nextMonth && me.state.year === me.state.nextYear) {
                    me.resetState(true, 0, 2, 1)
                }
                me.dateInput()
                me.datePanel(false)
                me.changeDom(dom)
                return
            }
            // 切换上一月
            if (e.target.classList.contains('date-picker-prev-btn-arrow') || e.target.parentNode.classList.contains('date-picker-prev-btn-arrow')) {
                // 日期范围模式下，有两个面板，切换右侧面板
                if (e.target.classList.contains('date-picker-range-right') || e.target.parentNode.classList.contains('date-picker-range-right')) {
                    me.resetState(true, 0, 2, -1)
                    // 日期范围模式下，有两个面板，切换右侧面板，至少保证右侧面板日期比左侧大一个月
                    if (me.state.month === me.state.nextMonth && me.state.year === me.state.nextYear) {
                        me.resetState(false, 0, 0, -1)
                    }
                    me.dateInput()
                    me.datePanel(false)
                    me.changeDom(dom)
                    return
                }
                me.resetState(false, 0, 0, -1)
                me.datePanel(false)
                me.changeDom(dom)
                return
            }
            // 切换下一年
            if (e.target.classList.contains('date-picker-next-btn-arrow-double') || e.target.parentNode.classList.contains('date-picker-next-btn-arrow-double')) {
                // 日期范围模式下，有两个面板，切换右侧面板，不影响左侧面板日期
                if (e.target.classList.contains('date-picker-range-right') || e.target.parentNode.classList.contains('date-picker-range-right')) {
                    me.resetState(true, 1, 3, 1)
                    me.datePanel(false)
                    me.changeDom(dom)
                    return
                }
                me.resetState(false, 1, 1, 1)
                // 日期范围模式下，有两个面板，切换左侧面板日期，至少保证右侧面板日期与左侧面板日期年份相同
                if (me.state.year > me.state.nextYear) {
                    me.resetState(true, 1, 1, 0)
                }
                // 当左侧面板切换到上一年，然后把月份切换到比右侧面板月份大，再将左侧面板年份切换回来发现bug
                if (me.state.nextYear === me.state.year && me.state.nextMonth <= me.state.month) {
                    me.resetState(false, 0, 2, -1)
                }
                me.datePanel(false)
                me.changeDom(dom)
                return
            }
            // 切换上一年
            if (e.target.classList.contains('date-picker-prev-btn-arrow-double') || e.target.parentNode.classList.contains('date-picker-prev-btn-arrow-double')) {
                if (me.state.time < 1970) {
                    return
                }
                // 日期范围模式下，有两个面板，切换右侧面板
                if (e.target.classList.contains('date-picker-range-right') || e.target.parentNode.classList.contains('date-picker-range-right')) {
                    me.resetState(true, 1, 3, -1)
                    // 至少保证右侧面板日期与左侧面板日期年份相同
                    if (me.state.nextYear < me.state.year) {
                        me.resetState(false, 1, 3, 0)
                    }
                    // 当右侧面板切换到下一年，然后把月份切换到比左侧面板月份小，再将右侧面板年份切换回来发现bug
                    if (me.state.nextYear === me.state.year && me.state.nextMonth <= me.state.month) {
                        me.resetState(true, 0, 0, 1)
                    }
                    me.datePanel(false)
                    me.changeDom(dom)
                    return
                }
                me.resetState(false, 1, 1, -1)
                me.datePanel(false)
                me.changeDom(dom)
                return
            }
            // 选中日期；e.target 是 em 情况
            if (e.target.nodeName === 'EM' && !(e.target.parentNode.classList.contains('date-picker-cells-cell-prev-month')
                || e.target.parentNode.classList.contains('date-picker-cells-cell-next-month')) ) {
                if (!me.double) {
                    // 针对选择单个日期修改选中样式
                    for (let i = 0; i < me.siblings(e.target.parentNode).length; i++) {
                        me.siblings(e.target.parentNode)[i].classList.contains('date-picker-cells-cell-selected') ?
                            me.siblings(e.target.parentNode)[i].classList.remove('date-picker-cells-cell-selected', 'date-picker-cells-focused') :
                                ''
                    }
                }
                // 日期范围情况下，设置 selectedCount 不超过2，一旦达到 2 就把被选中的日期样式清除。
                me.changeSelectedCount()
                e.target.parentNode.classList.add('date-picker-cells-cell-selected', 'date-picker-cells-focused')
                let m = `${me.state.month + 1}`,
                d = `${e.target.innerHTML}`
                if (me.state.month + 1 < 10) {
                    m = `0${me.state.month + 1}`
                }
                if (Number(e.target.innerHTML) < 10) {
                    d = `0${e.target.innerHTML}`
                }
                me.forCallBack(e, datePickerInput, m, d)
                return
            }
            // 选中日期；e.target 是 span 情况
            if (e.target.nodeName === 'SPAN' && !(e.target.classList.contains('date-picker-cells-cell-prev-month')
                || e.target.classList.contains('date-picker-cells-cell-next-month') || e.target.classList.contains('date-picker-week')) ) {
                if (!me.double) {
                    // 针对选择单个日期修改选中样式
                    for (let i = 0; i < me.siblings(e.target).length; i++) {
                        if (me.siblings(e.target)[i].classList.contains('date-picker-cells-cell-selected')) {
                            me.siblings(e.target)[i].classList.remove('date-picker-cells-cell-selected', 'date-picker-cells-focused')
                        }
                    }
                }
                // 日期范围情况下，设置 selectedCount 不超过2，一旦达到 2 就把被选中的日期样式清除。
                me.changeSelectedCount()
                e.target.classList.add('date-picker-cells-cell-selected', 'date-picker-cells-focused')
                let m = `${me.state.month + 1}`,
                d = `${e.target.children[0].innerHTML}`
                if (me.state.month + 1 < 10) {
                    m = `0${me.state.month + 1}`
                }
                if (Number(e.target.children[0].innerHTML) < 10) {
                    d = `0${e.target.children[0].innerHTML}`
                }
                me.forCallBack(e, datePickerInput, m, d)
                return
            }
        })
     };

     /**
      * 
      * @param {*} node 节点
      * @description 实现jq siblings()
      */
     siblings (node) {
        let brothers = [] 
        for (let i = 0; i < node.parentNode.children.length; i++) {
            if (node.parentNode.children[i] === node) {
                continue
            }
            brothers.push(node.parentNode.children[i])
        }
        return brothers
     };

     /**
      * 
      * @param {*} val string类型的，例如 '2018-08-30'
      * @description 将'2018-08-30'转换成[2018, 8, 30]，缓存在 this.inputValNum
      */
     splitInputVal (val) {
        val = val.split('-')
        this.inputValNum.length = 0
        for (let i = 0; i < val.length; i++) {
            this.inputValNum.push(Number(val[i]))
        }
     };

     /**
      * 
      * @param {*} e 被点击的 em
      * @description 根据被点击的em或span去找当前日期的年，月，选择日期范围时用到
      */
     findYM (e) {
        let ymArr
        if (e.target.nodeName === 'SPAN') {
            ymArr = e.path[3].children[0].innerText.split('')
            if (ymArr.length === 8) {
                return +e.target.children[0].innerHTML < 10 ? `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-0${ymArr[6]}-0${e.target.children[0].innerHTML}` : `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-0${ymArr[6]}-${e.target.children[0].innerHTML}`
            }
            if (ymArr.length === 9) {
                return +e.target.children[0].innerHTML < 10 ? `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-${ymArr[6]}${ymArr[7]}-0${e.target.children[0].innerHTML}` : `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-${ymArr[6]}${ymArr[7]}-${e.target.children[0].innerHTML}`
            }
        }
        ymArr = e.path[4].children[0].innerText.split('')
        if (ymArr.length === 8) {
            return +e.target.innerHTML < 10 ? `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-0${ymArr[6]}-0${e.target.innerHTML}` : `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-0${ymArr[6]}-${e.target.innerHTML}`
        }
        if (ymArr.length === 9) {
            return +e.target.innerHTML < 10 ? `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-${ymArr[6]}${ymArr[7]}-0${e.target.innerHTML}` : `${ymArr[0]}${ymArr[1]}${ymArr[2]}${ymArr[3]}-${ymArr[6]}${ymArr[7]}-${e.target.innerHTML}`
        }
     };

     /**
      * 
      * @param {*} fir 日期，string类型，格式为 '2018-09-11' 
      * @param {*} sec 日期，string类型，格式为 '2018-09-11'
      * @description 比较两个日期大小
      */
     compare (fir, sec) {
        return new Date(fir).getTime() > new Date(sec).getTime()
     };

     /**
      * @description 日期范围情况下，点击日期切换选中状态
      *              两两成对，保证至多只有两个日期被选中激活
      */
     dateRangeChangeActived () {
        // 由于日期范围是两个一样的面板，通过e.target来取有点麻烦，所以只好采取原生document.getElementsByClassName
        // 这里开发时遇到个问题，for循环内去移出class时，导致 selectedArr 也发生改变，
        // 比如 selectedArr 里面有两个具有该class的span，当我对selectedArr中的一个span移除class时
        // 实际上 selectedArr 也会相应改变(相当于根据class对同样的对象进行获取与移除)
        // 这样的话，不断移除，selectedArr不断减少，最终全部移除，所以不断selectedArr[0].classList.remove()即可
        let selectedArr = document.getElementsByClassName('date-picker-cells-cell-selected')
        let len = selectedArr.length
        for (let i = 0; i < len; i++) {
            selectedArr[0].classList.remove('date-picker-cells-cell-selected', 'date-picker-cells-focused')
        }
     };

     /**
      * @description 日期范围情况下，根据点击事件改变selectedCount，控制日期选中状态
      */
     changeSelectedCount () {
        if (this.double) {
            if (this.selectedCount === 2) {
                this.selectedCount = 1
                this.dateRangeChangeActived()
            } else {
                this.selectedCount += 1
            }
        } 
     };

    /**
      * @param {*} isNext boolean类型，判断修改 this.state.nextTime 还是 this.state.time
      * @param {*} ym 0和1；0代表 setMonth，1代表 setFullYear。 Number
      * @param {*} refer 0,1,2,3；
      *                  0 代表以 this.state.month 为参数进行修改 ，
      *                  1 代表以 this.state.year 为参数进行修改 ，
      *                  2 代表以 this.state.nextMonth 为参数进行修改 。
      *                  3 代表以 this.state.nextYear 为参数进行修改 。
      *                  Number
      * @param {*} pn -1, 0, 1；
      *               0代表当前 this.state.month/year 或 this.state.nextYear/nextMonth；
      *               -1代表上一个月/上一年；
      *               1代表下个月/明年。
      *               Number
      * @description 把重复修改this.state代码抽出来
      */
     resetState (isNext, ym, refer, pn) {
        if (isNext) {
            if (ym === 0) {
                refer === 0 ? this.state.nextTime.setMonth(this.state.month + pn) : ''
                refer === 2 ? this.state.nextTime.setMonth(this.state.nextMonth + pn) : ''
            }
            if (ym === 1) {
                refer === 1 ? this.state.nextTime.setFullYear(this.state.year + pn) : ''
                refer === 3 ? this.state.nextTime.setFullYear(this.state.nextYear + pn) : ''
            }
            this.state.nextYear = this.state.nextTime.getFullYear()
            this.state.nextMonth = this.state.nextTime.getMonth()
            this.state.nextDate = this.state.nextTime.getDate()
            return
        }
        if (ym === 0) {
            refer === 0 ? this.state.time.setMonth(this.state.month + pn) : ''
            refer === 2 ? this.state.time.setMonth(this.state.nextMonth + pn) : ''
        }
        if (ym === 1) {
            refer === 1 ? this.state.time.setFullYear(this.state.year + pn) : ''
            refer === 3 ? this.state.time.setFullYear(this.state.nextYear + pn) : ''
        }
        this.state.year = this.state.time.getFullYear()
        this.state.month = this.state.time.getMonth()
        this.state.date = this.state.time.getDate()
     };

     /**
      * 
      * @param {*} e 节点
      * @param {*} datePickerInput 日期选择器输入框
      * @param {*} m 月份，string
      * @param {*} d 日期，string
      * @description 该方法用于点击选中日期时改变日期状态以及将被选中的日期回调出去
      */
     forCallBack (e, datePickerInput, m, d) {
         // 选择单个日期情况
         if (this.double === false) {
            this.inputVal.length = 0
            datePickerInput.value = `${this.state.year}-${m}-${d}`
            this.inputVal.push(datePickerInput.value)
            this.splitInputVal(this.inputVal[0])
        } else {
        // 选择日期范围情况
            this.inputVal.length === 2 ? this.inputVal.length = 0 : ''
            if (this.inputVal.length === 0) {
                this.inputVal.push(this.findYM(e))
                // 如果点击选中两个日期后，切换年月，在点击选中某个日期，那么切换回年月后之前被选中的日期依然处于选中状态
                // 为了解决这个问题，需要对this.inputValNum进行重新赋值
                this.splitInputVal(this.inputVal[0])
                return
            }
            // 确保正确的日期范围，保证不管怎么点击，较大日期排在后面
            this.inputVal.length === 1 ? 
                this.compare(this.inputVal[0], this.findYM(e)) ? 
                    this.inputVal.unshift(this.findYM(e)) : this.inputVal.push(this.findYM(e)) : ''
            if (new Date(this.inputVal[0]).getTime() === new Date(this.inputVal[1]).getTime()) {
                this.inputVal.length = 1
                return
            }
            this.splitInputVal(`${this.inputVal[0]}-${this.inputVal[1]}`)
            datePickerInput.value = `${this.inputVal[0]} - ${this.inputVal[1]}`
            this.cacheValue = datePickerInput.value
        }
        this.callback(this.inputVal)
     }
 }