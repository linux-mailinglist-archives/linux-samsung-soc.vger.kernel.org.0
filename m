Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A945E1592
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Oct 2019 11:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390835AbfJWJQy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Oct 2019 05:16:54 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42510 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390604AbfJWJQw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 05:16:52 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191023091648euoutp018bc7cb48f48b2618407cb72af794f881~QO-idZe7o0381603816euoutp012
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2019 09:16:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191023091648euoutp018bc7cb48f48b2618407cb72af794f881~QO-idZe7o0381603816euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571822208;
        bh=jCHaqoixzR4kTEIPfSWPcQxwjmFV9lKQJC5cfdIjjmw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kDZabCfz1CzG+4SJczWoCTGu6HrMSS+TV5LPf0vAnGJtYmS/p9sGO99mGjYSuvrpC
         aFdlDvxacnD1dQAFmTs9m2f9XO125TLoXCVJ2c9DAmt9PnWXztN3jUwkNgt+OpxTul
         J53hGUOy9jmZ+7t6S0R0CkYQdJXUhSZ2BISR7SkQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191023091648eucas1p100497f81bcf3a0b8744e4dc2ebcf3cef~QO-iEMb9Y0313203132eucas1p1p;
        Wed, 23 Oct 2019 09:16:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C6.2A.04374.08A10BD5; Wed, 23
        Oct 2019 10:16:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191023091648eucas1p12dcc4e9041169e3c7ae43f4ea525dd7f~QO-hm7CkP2004620046eucas1p1T;
        Wed, 23 Oct 2019 09:16:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191023091648eusmtrp2c73f5460079a4d7a4f975a7f72670e5b~QO-hmN7dj1408514085eusmtrp2g;
        Wed, 23 Oct 2019 09:16:48 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-12-5db01a807d87
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 72.39.04166.F7A10BD5; Wed, 23
        Oct 2019 10:16:47 +0100 (BST)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191023091647eusmtip2427b86cd7ba4127666c0d77ebc58cedf~QO-hJMVZj0280102801eusmtip2E;
        Wed, 23 Oct 2019 09:16:47 +0000 (GMT)
Subject: Re: [PATCH net-next] r8152: support request_firmware for RTL8153
To:     Hayes Wang <hayeswang@realtek.com>, netdev@vger.kernel.org
Cc:     nic_swsd@realtek.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, pmalani@chromium.org,
        grundler@chromium.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <44261242-ff44-0067-bbb9-2241e400ad53@samsung.com>
Date:   Wed, 23 Oct 2019 11:16:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1394712342-15778-329-Taiwan-albertk@realtek.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7oNUhtiDWa8lbZ4deQHk8W0gz2M
        FufPb2C3uLxrDpvFjPP7mCwWLWtltji2QMziS+8sVoupF2azO3B6zG64yOKxaVUnm8fjt5vZ
        PT5vkgtgieKySUnNySxLLdK3S+DKaH6zl6Xg0RfGiiMbd7M0MO48wNjFyMkhIWAi0XTvM1MX
        IxeHkMAKRomdl18xQjhfGCWubr7CDOF8ZpRo/r2XDablwuXdYO1CAssZJdYt5YMoessocb1j
        OjNIQljAU+LPiwVgDSICdhLTX14AG8ss8IRRomfzVyaQBJuAoUTX2y6wIl6gor1bboJNZRFQ
        lTh38CyYLSoQK3Hvx3FmiBpBiZMzn7CA2JxA9V8eTASLMwvISzRvnQ1li0vcejIf7CEJgW3s
        EvcngxRxADkuEm+ua0N8ICzx6vgWdghbRuL/Tpj6ZkaJh+fWskM4PYwSl5tmQIPJWuLw8Yus
        IIOYBTQl1u/Shwg7Six+85AFYj6fxI23ghA38ElM2jYdai2vREebEES1msSs4+vg1h68cIl5
        AqPSLCSfzULyzSwk38xC2LuAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYEI6/e/4
        1x2M+/4kHWIU4GBU4uGd8XFdrBBrYllxZe4hRgkOZiUR3jsGa2OFeFMSK6tSi/Lji0pzUosP
        MUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MKqmlyvGnr+5IkfLXtgzdNGDBYErLO8U
        6bmk3jm/RmPBPdvPy3+vP3Iw/1finD9yLnuXPY/RnnSGo6hB+cIsw7mCh0Rf52zbaT3XKqXv
        mP3xzaaf6v9sWiZXpNj+4Id4lQnXWS9Zn9lt8h25/httpbZY/Zp34GGgiXrc8on8mTb6jEtq
        bVeEfVZiKc5INNRiLipOBAAl0FEpRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7r1UhtiDWa32li8OvKDyWLawR5G
        i/PnN7BbXN41h81ixvl9TBaLlrUyWxxbIGbxpXcWq8XUC7PZHTg9ZjdcZPHYtKqTzePx283s
        Hp83yQWwROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        JehlNL/Zy1Lw6AtjxZGNu1kaGHceYOxi5OSQEDCRuHB5N5DNxSEksJRR4tWcN1AJGYmT0xpY
        IWxhiT/Xutggil4zSmw4s5AZJCEs4Cnx58UCNhBbRMBOYvrLC2CTmAWeMEq87TsAViQkYCux
        7vJzsKlsAoYSXW+7wBp4gRr2brkJFmcRUJU4d/AskM3BISoQK7FprxlEiaDEyZlPWEBsTqDy
        Lw8mgo1kFjCTmLf5IZQtL9G8dTaULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbn
        pucWG+oVJ+YWl+al6yXn525iBEbgtmM/N+9gvLQx+BCjAAejEg/vjI/rYoVYE8uKK3MPMUpw
        MCuJ8N4xWBsrxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnA5JBXEm9oamhuYWlobmxubGah
        JM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFRt/JQ3sabO/pX5WjztllYOW1ePGPnqqvBP5Zq
        HD5szzhR/W2ceRT/rG3OCtqZRdblT8vaTv3mXPQt4YeW0I25mzwYxLgnHK8q3axe9+lPH29a
        d03+yuNcx0siQm22JsqoPC/VTQs7c4kj+qGiSPDrW3dLxeLZZ30pLsjY2vYig2VNstVsriwl
        luKMREMt5qLiRAAfebCs1gIAAA==
X-CMS-MailID: 20191023091648eucas1p12dcc4e9041169e3c7ae43f4ea525dd7f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191023091648eucas1p12dcc4e9041169e3c7ae43f4ea525dd7f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191023091648eucas1p12dcc4e9041169e3c7ae43f4ea525dd7f
References: <1394712342-15778-329-Taiwan-albertk@realtek.com>
        <CGME20191023091648eucas1p12dcc4e9041169e3c7ae43f4ea525dd7f@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Hayes,

On 16.10.2019 05:02, Hayes Wang wrote:
> This patch supports loading additional firmware file through
> request_firmware().
>
> A firmware file may include a header followed by several blocks
> which have different types of firmware. Currently, the supported
> types are RTL_FW_END, RTL_FW_PLA, and RTL_FW_USB.
>
> The firmware is used to fix some compatible or hardware issues. For
> example, the device couldn't be found after rebooting several times.
>
> The supported chips are
> 	RTL_VER_04 (rtl8153a-2.fw)
> 	RTL_VER_05 (rtl8153a-3.fw)
> 	RTL_VER_06 (rtl8153a-4.fw)
> 	RTL_VER_09 (rtl8153b-2.fw)
>
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>

This patch (which landed in linux-next last days) causes a following 
kernel oops on the ARM 32bit Exynos5422 SoC based Odroid XU4 board:

usb 6-1: new SuperSpeed Gen 1 USB device number 2 using xhci-hcd
usb 6-1: New USB device found, idVendor=0bda, idProduct=8153, 
bcdDevice=30.00
usb 6-1: New USB device strings: Mfr=1, Product=2, SerialNumber=6
usb 6-1: Product: USB 10/100/1000 LAN
usb 6-1: Manufacturer: Realtek
usb 6-1: SerialNumber: 000001000000
usb 6-1: reset SuperSpeed Gen 1 USB device number 2 using xhci-hcd
r8152 6-1:1.0: Direct firmware load for rtl_nic/rtl8153a-3.fw failed 
with error -2
r8152 6-1:1.0: unable to load firmware patch rtl_nic/rtl8153a-3.fw (-2)
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000002
pgd = (ptrval)
[00000002] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 131 Comm: kworker/0:2 Not tainted 
5.4.0-rc1-00539-g9370f2d05a2a #6788
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
Workqueue: events_long rtl_hw_phy_work_func_t
PC is at rtl8152_apply_firmware+0x14/0x464
LR is at r8153_hw_phy_cfg+0x24/0x17c
pc : [<c064f4e4>]    lr : [<c064fa18>]    psr: a0000013
sp : e75c9e60  ip : 60000013  fp : c11b7614
r10: e883b91c  r9 : 00000000  r8 : fffffffe
r7 : e883b640  r6 : fffffffe  r5 : fffffffe  r4 : e883b640
r3 : 736cfe7c  r2 : 736cfe7c  r1 : 000052f8  r0 : e883b640
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 6640006a  DAC: 00000051
Process kworker/0:2 (pid: 131, stack limit = 0x(ptrval))
Stack: (0xe75c9e60 to 0xe75ca000)
...
[<c064f4e4>] (rtl8152_apply_firmware) from [<c064fa18>] 
(r8153_hw_phy_cfg+0x24/0x17c)
[<c064fa18>] (r8153_hw_phy_cfg) from [<c064e784>] 
(rtl_hw_phy_work_func_t+0x220/0x3e4)
[<c064e784>] (rtl_hw_phy_work_func_t) from [<c0148a74>] 
(process_one_work+0x22c/0x7c8)
[<c0148a74>] (process_one_work) from [<c0149054>] (worker_thread+0x44/0x520)
[<c0149054>] (worker_thread) from [<c0150548>] (kthread+0x130/0x164)
[<c0150548>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
Exception stack(0xe75c9fb0 to 0xe75c9ff8)
...
---[ end trace 0995684a5160c8b5 ]---

I don't have firmware files for that chip, but the driver shouldn't 
crash in such case.


> ---
>   drivers/net/usb/r8152.c | 768 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 756 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 54a83f734ede..55d0bcb00aef 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -24,9 +24,11 @@
>   #include <linux/suspend.h>
>   #include <linux/atomic.h>
>   #include <linux/acpi.h>
> +#include <linux/firmware.h>
> +#include <crypto/hash.h>
>   
>   /* Information for net-next */
> -#define NETNEXT_VERSION		"10"
> +#define NETNEXT_VERSION		"11"
>   
>   /* Information for net */
>   #define NET_VERSION		"10"
> @@ -54,8 +56,11 @@
>   #define PLA_BDC_CR		0xd1a0
>   #define PLA_TEREDO_TIMER	0xd2cc
>   #define PLA_REALWOW_TIMER	0xd2e8
> +#define PLA_UPHY_TIMER		0xd388
>   #define PLA_SUSPEND_FLAG	0xd38a
>   #define PLA_INDICATE_FALG	0xd38c
> +#define PLA_MACDBG_PRE		0xd38c	/* RTL_VER_04 only */
> +#define PLA_MACDBG_POST		0xd38e	/* RTL_VER_04 only */
>   #define PLA_EXTRA_STATUS	0xd398
>   #define PLA_EFUSE_DATA		0xdd00
>   #define PLA_EFUSE_CMD		0xdd02
> @@ -110,7 +115,12 @@
>   #define USB_CONNECT_TIMER	0xcbf8
>   #define USB_MSC_TIMER		0xcbfc
>   #define USB_BURST_SIZE		0xcfc0
> +#define USB_FW_FIX_EN0		0xcfca
> +#define USB_FW_FIX_EN1		0xcfcc
>   #define USB_LPM_CONFIG		0xcfd8
> +#define USB_CSTMR		0xcfef	/* RTL8153A */
> +#define USB_FW_CTRL		0xd334	/* RTL8153B */
> +#define USB_FC_TIMER		0xd340
>   #define USB_USB_CTRL		0xd406
>   #define USB_PHY_CTRL		0xd408
>   #define USB_TX_AGG		0xd40a
> @@ -126,6 +136,7 @@
>   #define USB_LPM_CTRL		0xd41a
>   #define USB_BMU_RESET		0xd4b0
>   #define USB_U1U2_TIMER		0xd4da
> +#define USB_FW_TASK		0xd4e8	/* RTL8153B */
>   #define USB_UPS_CTRL		0xd800
>   #define USB_POWER_CUT		0xd80a
>   #define USB_MISC_0		0xd81a
> @@ -133,18 +144,19 @@
>   #define USB_AFE_CTRL2		0xd824
>   #define USB_UPS_CFG		0xd842
>   #define USB_UPS_FLAGS		0xd848
> +#define USB_WDT1_CTRL		0xe404
>   #define USB_WDT11_CTRL		0xe43c
> -#define USB_BP_BA		0xfc26
> -#define USB_BP_0		0xfc28
> -#define USB_BP_1		0xfc2a
> -#define USB_BP_2		0xfc2c
> -#define USB_BP_3		0xfc2e
> -#define USB_BP_4		0xfc30
> -#define USB_BP_5		0xfc32
> -#define USB_BP_6		0xfc34
> -#define USB_BP_7		0xfc36
> -#define USB_BP_EN		0xfc38
> -#define USB_BP_8		0xfc38
> +#define USB_BP_BA		PLA_BP_BA
> +#define USB_BP_0		PLA_BP_0
> +#define USB_BP_1		PLA_BP_1
> +#define USB_BP_2		PLA_BP_2
> +#define USB_BP_3		PLA_BP_3
> +#define USB_BP_4		PLA_BP_4
> +#define USB_BP_5		PLA_BP_5
> +#define USB_BP_6		PLA_BP_6
> +#define USB_BP_7		PLA_BP_7
> +#define USB_BP_EN		PLA_BP_EN	/* RTL8153A */
> +#define USB_BP_8		0xfc38		/* RTL8153B */
>   #define USB_BP_9		0xfc3a
>   #define USB_BP_10		0xfc3c
>   #define USB_BP_11		0xfc3e
> @@ -346,7 +358,12 @@
>   /* PLA_INDICATE_FALG */
>   #define UPCOMING_RUNTIME_D3	BIT(0)
>   
> +/* PLA_MACDBG_PRE and PLA_MACDBG_POST */
> +#define DEBUG_OE		BIT(0)
> +#define DEBUG_LTSSM		0x0082
> +
>   /* PLA_EXTRA_STATUS */
> +#define U3P3_CHECK_EN		BIT(7)	/* RTL_VER_05 only */
>   #define LINK_CHANGE_FLAG	BIT(8)
>   
>   /* USB_USB2PHY */
> @@ -368,6 +385,12 @@
>   #define STAT_SPEED_HIGH		0x0000
>   #define STAT_SPEED_FULL		0x0002
>   
> +/* USB_FW_FIX_EN0 */
> +#define FW_FIX_SUSPEND		BIT(14)
> +
> +/* USB_FW_FIX_EN1 */
> +#define FW_IP_RESET_EN		BIT(9)
> +
>   /* USB_LPM_CONFIG */
>   #define LPM_U1U2_EN		BIT(0)
>   
> @@ -392,12 +415,24 @@
>   #define OWN_UPDATE		BIT(0)
>   #define OWN_CLEAR		BIT(1)
>   
> +/* USB_FW_TASK */
> +#define FC_PATCH_TASK		BIT(1)
> +
>   /* USB_UPS_CTRL */
>   #define POWER_CUT		0x0100
>   
>   /* USB_PM_CTRL_STATUS */
>   #define RESUME_INDICATE		0x0001
>   
> +/* USB_CSTMR */
> +#define FORCE_SUPER		BIT(0)
> +
> +/* USB_FW_CTRL */
> +#define FLOW_CTRL_PATCH_OPT	BIT(1)
> +
> +/* USB_FC_TIMER */
> +#define CTRL_TIMER_EN		BIT(15)
> +
>   /* USB_USB_CTRL */
>   #define RX_AGG_DISABLE		0x0010
>   #define RX_ZERO_EN		0x0080
> @@ -419,6 +454,9 @@
>   #define COALESCE_HIGH		250000U
>   #define COALESCE_SLOW		524280U
>   
> +/* USB_WDT1_CTRL */
> +#define WTD1_EN			BIT(0)
> +
>   /* USB_WDT11_CTRL */
>   #define TIMER11_EN		0x0001
>   
> @@ -570,6 +608,8 @@ enum spd_duplex {
>   #define EFUSE			0xcfdb
>   #define PASS_THRU_MASK		0x1
>   
> +#define BP4_SUPER_ONLY		0x1578	/* RTL_VER_04 only */
> +
>   enum rtl_register_content {
>   	_1000bps	= 0x10,
>   	_100bps		= 0x08,
> @@ -766,6 +806,19 @@ struct r8152 {
>   		u32 ctap_short_off:1;
>   	} ups_info;
>   
> +#define RTL_VER_SIZE		32
> +
> +	struct rtl_fw {
> +		const char *fw_name;
> +		const struct firmware *fw;
> +
> +		char version[RTL_VER_SIZE];
> +		int (*pre_fw)(struct r8152 *tp);
> +		int (*post_fw)(struct r8152 *tp);
> +
> +		bool retry;
> +	} rtl_fw;
> +
>   	atomic_t rx_count;
>   
>   	bool eee_en;
> @@ -788,6 +841,76 @@ struct r8152 {
>   	u8 autoneg;
>   };
>   
> +/**
> + * struct fw_block - block type and total length
> + * @type: type of the current block, such as RTL_FW_END, RTL_FW_PLA,
> + *	RTL_FW_USB and so on.
> + * @length: total length of the current block.
> + */
> +struct fw_block {
> +	__le32 type;
> +	__le32 length;
> +} __packed;
> +
> +/**
> + * struct fw_header - header of the firmware file
> + * @checksum: checksum of sha256 which is calculated from the whole file
> + *	except the checksum field of the file. That is, calculate sha256
> + *	from the version field to the end of the file.
> + * @version: version of this firmware.
> + * @blocks: the first firmware block of the file
> + */
> +struct fw_header {
> +	u8 checksum[32];
> +	char version[RTL_VER_SIZE];
> +	struct fw_block blocks[0];
> +} __packed;
> +
> +/**
> + * struct fw_type_1 - a firmware block used by RTL_FW_PLA and RTL_FW_USB.
> + *	The layout of the firmware block is:
> + *	<struct fw_type_1> + <info> + <firmware data>.
> + * @fw_offset: offset of the firmware binary data. The start address of
> + *	the data would be the address of struct fw_type_1 + @fw_offset.
> + * @fw_reg: the register to load the firmware. Depends on chip.
> + * @bp_ba_addr: the register to write break point base address. Depends on
> + *	chip.
> + * @bp_ba_value: break point base address. Depends on chip.
> + * @bp_en_addr: the register to write break point enabled mask. Depends
> + *	on chip.
> + * @bp_en_value: break point enabled mask. Depends on the firmware.
> + * @bp_start: the start register of break points. Depends on chip.
> + * @bp_num: the break point number which needs to be set for this firmware.
> + *	Depends on the firmware.
> + * @bp: break points. Depends on firmware.
> + * @fw_ver_reg: the register to store the fw version.
> + * @fw_ver_data: the firmware version of the current type.
> + * @info: additional information for debugging, and is followed by the
> + *	binary data of firmware.
> + */
> +struct fw_type_1 {
> +	struct fw_block blk_hdr;
> +	__le16 fw_offset;
> +	__le16 fw_reg;
> +	__le16 bp_ba_addr;
> +	__le16 bp_ba_value;
> +	__le16 bp_en_addr;
> +	__le16 bp_en_value;
> +	__le16 bp_start;
> +	__le16 bp_num;
> +	__le16 bp[16]; /* any value determined by firmware */
> +	__le32 reserved;
> +	__le16 fw_ver_reg;
> +	u8 fw_ver_data;
> +	char info[0];
> +} __packed;
> +
> +enum rtl_fw_type {
> +	RTL_FW_END = 0,
> +	RTL_FW_PLA,
> +	RTL_FW_USB,
> +};
> +
>   enum rtl_version {
>   	RTL_VER_UNKNOWN = 0,
>   	RTL_VER_01,
> @@ -3226,6 +3349,435 @@ static void rtl_reset_bmu(struct r8152 *tp)
>   	ocp_write_byte(tp, MCU_TYPE_USB, USB_BMU_RESET, ocp_data);
>   }
>   
> +/* Clear the bp to stop the firmware before loading a new one */
> +static void rtl_clear_bp(struct r8152 *tp, u16 type)
> +{
> +	switch (tp->version) {
> +	case RTL_VER_01:
> +	case RTL_VER_02:
> +	case RTL_VER_07:
> +		break;
> +	case RTL_VER_03:
> +	case RTL_VER_04:
> +	case RTL_VER_05:
> +	case RTL_VER_06:
> +		ocp_write_byte(tp, type, PLA_BP_EN, 0);
> +		break;
> +	case RTL_VER_08:
> +	case RTL_VER_09:
> +	default:
> +		if (type == MCU_TYPE_USB) {
> +			ocp_write_byte(tp, MCU_TYPE_USB, USB_BP2_EN, 0);
> +
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_8, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_9, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_10, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_11, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_12, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_13, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_14, 0);
> +			ocp_write_word(tp, MCU_TYPE_USB, USB_BP_15, 0);
> +		} else {
> +			ocp_write_byte(tp, MCU_TYPE_PLA, PLA_BP_EN, 0);
> +		}
> +		break;
> +	}
> +
> +	ocp_write_word(tp, type, PLA_BP_0, 0);
> +	ocp_write_word(tp, type, PLA_BP_1, 0);
> +	ocp_write_word(tp, type, PLA_BP_2, 0);
> +	ocp_write_word(tp, type, PLA_BP_3, 0);
> +	ocp_write_word(tp, type, PLA_BP_4, 0);
> +	ocp_write_word(tp, type, PLA_BP_5, 0);
> +	ocp_write_word(tp, type, PLA_BP_6, 0);
> +	ocp_write_word(tp, type, PLA_BP_7, 0);
> +
> +	/* wait 3 ms to make sure the firmware is stopped */
> +	usleep_range(3000, 6000);
> +	ocp_write_word(tp, type, PLA_BP_BA, 0);
> +}
> +
> +static bool rtl8152_is_fw_type1_ok(struct r8152 *tp, struct fw_type_1 *type1)
> +{
> +	u16 fw_reg, bp_ba_addr, bp_en_addr, bp_start;
> +	bool rc = false;
> +	u32 length, type;
> +	int i, max_bp;
> +
> +	type = __le32_to_cpu(type1->blk_hdr.type);
> +	if (type == RTL_FW_PLA) {
> +		switch (tp->version) {
> +		case RTL_VER_01:
> +		case RTL_VER_02:
> +		case RTL_VER_07:
> +			fw_reg = 0xf800;
> +			bp_ba_addr = PLA_BP_BA;
> +			bp_en_addr = 0;
> +			bp_start = PLA_BP_0;
> +			max_bp = 8;
> +			break;
> +		case RTL_VER_03:
> +		case RTL_VER_04:
> +		case RTL_VER_05:
> +		case RTL_VER_06:
> +		case RTL_VER_08:
> +		case RTL_VER_09:
> +			fw_reg = 0xf800;
> +			bp_ba_addr = PLA_BP_BA;
> +			bp_en_addr = PLA_BP_EN;
> +			bp_start = PLA_BP_0;
> +			max_bp = 8;
> +			break;
> +		default:
> +			goto out;
> +		}
> +	} else if (type == RTL_FW_USB) {
> +		switch (tp->version) {
> +		case RTL_VER_03:
> +		case RTL_VER_04:
> +		case RTL_VER_05:
> +		case RTL_VER_06:
> +			fw_reg = 0xf800;
> +			bp_ba_addr = USB_BP_BA;
> +			bp_en_addr = USB_BP_EN;
> +			bp_start = USB_BP_0;
> +			max_bp = 8;
> +			break;
> +		case RTL_VER_08:
> +		case RTL_VER_09:
> +			fw_reg = 0xe600;
> +			bp_ba_addr = USB_BP_BA;
> +			bp_en_addr = USB_BP2_EN;
> +			bp_start = USB_BP_0;
> +			max_bp = 16;
> +			break;
> +		case RTL_VER_01:
> +		case RTL_VER_02:
> +		case RTL_VER_07:
> +		default:
> +			goto out;
> +		}
> +	} else {
> +		goto out;
> +	}
> +
> +	length = __le32_to_cpu(type1->blk_hdr.length);
> +	if (length < __le16_to_cpu(type1->fw_offset)) {
> +		dev_err(&tp->intf->dev, "invalid fw_offset\n");
> +		goto out;
> +	}
> +
> +	length -= __le16_to_cpu(type1->fw_offset);
> +	if (length < 4 || (length & 3)) {
> +		dev_err(&tp->intf->dev, "invalid block length\n");
> +		goto out;
> +	}
> +
> +	if (__le16_to_cpu(type1->fw_reg) != fw_reg) {
> +		dev_err(&tp->intf->dev, "invalid register to load firmware\n");
> +		goto out;
> +	}
> +
> +	if (__le16_to_cpu(type1->bp_ba_addr) != bp_ba_addr) {
> +		dev_err(&tp->intf->dev, "invalid base address register\n");
> +		goto out;
> +	}
> +
> +	if (__le16_to_cpu(type1->bp_en_addr) != bp_en_addr) {
> +		dev_err(&tp->intf->dev, "invalid enabled mask register\n");
> +		goto out;
> +	}
> +
> +	if (__le16_to_cpu(type1->bp_start) != bp_start) {
> +		dev_err(&tp->intf->dev,
> +			"invalid start register of break point\n");
> +		goto out;
> +	}
> +
> +	if (__le16_to_cpu(type1->bp_num) > max_bp) {
> +		dev_err(&tp->intf->dev, "invalid break point number\n");
> +		goto out;
> +	}
> +
> +	for (i = __le16_to_cpu(type1->bp_num); i < max_bp; i++) {
> +		if (type1->bp[i]) {
> +			dev_err(&tp->intf->dev, "unused bp%u is not zero\n", i);
> +			goto out;
> +		}
> +	}
> +
> +	rc = true;
> +out:
> +	return rc;
> +}
> +
> +/* Verify the checksum for the firmware file. It is calculated from the version
> + * field to the end of the file. Compare the result with the checksum field to
> + * make sure the file is correct.
> + */
> +static long rtl8152_fw_verify_checksum(struct r8152 *tp,
> +				       struct fw_header *fw_hdr, size_t size)
> +{
> +	unsigned char checksum[sizeof(fw_hdr->checksum)];
> +	struct crypto_shash *alg;
> +	struct shash_desc *sdesc;
> +	size_t len;
> +	long rc;
> +
> +	alg = crypto_alloc_shash("sha256", 0, 0);
> +	if (IS_ERR(alg)) {
> +		rc = PTR_ERR(alg);
> +		goto out;
> +	}
> +
> +	if (crypto_shash_digestsize(alg) != sizeof(fw_hdr->checksum)) {
> +		rc = -EFAULT;
> +		dev_err(&tp->intf->dev, "digestsize incorrect (%u)\n",
> +			crypto_shash_digestsize(alg));
> +		goto free_shash;
> +	}
> +
> +	len = sizeof(*sdesc) + crypto_shash_descsize(alg);
> +	sdesc = kmalloc(len, GFP_KERNEL);
> +	if (!sdesc) {
> +		rc = -ENOMEM;
> +		goto free_shash;
> +	}
> +	sdesc->tfm = alg;
> +
> +	len = size - sizeof(fw_hdr->checksum);
> +	rc = crypto_shash_digest(sdesc, fw_hdr->version, len, checksum);
> +	kfree(sdesc);
> +	if (rc)
> +		goto free_shash;
> +
> +	if (memcmp(fw_hdr->checksum, checksum, sizeof(fw_hdr->checksum))) {
> +		dev_err(&tp->intf->dev, "checksum fail\n");
> +		rc = -EFAULT;
> +	}
> +
> +free_shash:
> +	crypto_free_shash(alg);
> +out:
> +	return rc;
> +}
> +
> +static long rtl8152_check_firmware(struct r8152 *tp, struct rtl_fw *rtl_fw)
> +{
> +	const struct firmware *fw = rtl_fw->fw;
> +	struct fw_header *fw_hdr = (struct fw_header *)fw->data;
> +	struct fw_type_1 *pla = NULL, *usb = NULL;
> +	long ret = -EFAULT;
> +	int i;
> +
> +	if (fw->size < sizeof(*fw_hdr)) {
> +		dev_err(&tp->intf->dev, "file too small\n");
> +		goto fail;
> +	}
> +
> +	ret = rtl8152_fw_verify_checksum(tp, fw_hdr, fw->size);
> +	if (ret)
> +		goto fail;
> +
> +	ret = -EFAULT;
> +
> +	for (i = sizeof(*fw_hdr); i < fw->size;) {
> +		struct fw_block *block = (struct fw_block *)&fw->data[i];
> +		u32 type;
> +
> +		if ((i + sizeof(*block)) > fw->size)
> +			goto fail;
> +
> +		type = __le32_to_cpu(block->type);
> +		switch (type) {
> +		case RTL_FW_END:
> +			if (__le32_to_cpu(block->length) != sizeof(*block))
> +				goto fail;
> +			goto success;
> +		case RTL_FW_PLA:
> +			if (pla) {
> +				dev_err(&tp->intf->dev,
> +					"multiple PLA firmware encountered");
> +				goto fail;
> +			}
> +
> +			pla = (struct fw_type_1 *)block;
> +			if (!rtl8152_is_fw_type1_ok(tp, pla)) {
> +				dev_err(&tp->intf->dev,
> +					"load PLA firmware failed\n");
> +				goto fail;
> +			}
> +			break;
> +		case RTL_FW_USB:
> +			if (usb) {
> +				dev_err(&tp->intf->dev,
> +					"multiple USB firmware encountered");
> +				goto fail;
> +			}
> +
> +			usb = (struct fw_type_1 *)block;
> +			if (!rtl8152_is_fw_type1_ok(tp, usb)) {
> +				dev_err(&tp->intf->dev,
> +					"load USB firmware failed\n");
> +				goto fail;
> +			}
> +			break;
> +		default:
> +			dev_warn(&tp->intf->dev, "Unknown type %u is found\n",
> +				 type);
> +			break;
> +		}
> +
> +		/* next block */
> +		i += ALIGN(__le32_to_cpu(block->length), 8);
> +	}
> +
> +success:
> +	return 0;
> +fail:
> +	return ret;
> +}
> +
> +static void rtl8152_fw_type_1_apply(struct r8152 *tp, struct fw_type_1 *type1)
> +{
> +	u16 bp_en_addr, bp_index, type, bp_num, fw_ver_reg;
> +	u32 length;
> +	u8 *data;
> +	int i;
> +
> +	switch (__le32_to_cpu(type1->blk_hdr.type)) {
> +	case RTL_FW_PLA:
> +		type = MCU_TYPE_PLA;
> +		break;
> +	case RTL_FW_USB:
> +		type = MCU_TYPE_USB;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	rtl_clear_bp(tp, type);
> +
> +	/* Enable backup/restore of MACDBG. This is required after clearing PLA
> +	 * break points and before applying the PLA firmware.
> +	 */
> +	if (tp->version == RTL_VER_04 && type == MCU_TYPE_PLA &&
> +	    !(ocp_read_word(tp, MCU_TYPE_PLA, PLA_MACDBG_POST) & DEBUG_OE)) {
> +		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MACDBG_PRE, DEBUG_LTSSM);
> +		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MACDBG_POST, DEBUG_LTSSM);
> +	}
> +
> +	length = __le32_to_cpu(type1->blk_hdr.length);
> +	length -= __le16_to_cpu(type1->fw_offset);
> +
> +	data = (u8 *)type1;
> +	data += __le16_to_cpu(type1->fw_offset);
> +
> +	generic_ocp_write(tp, __le16_to_cpu(type1->fw_reg), 0xff, length, data,
> +			  type);
> +
> +	ocp_write_word(tp, type, __le16_to_cpu(type1->bp_ba_addr),
> +		       __le16_to_cpu(type1->bp_ba_value));
> +
> +	bp_index = __le16_to_cpu(type1->bp_start);
> +	bp_num = __le16_to_cpu(type1->bp_num);
> +	for (i = 0; i < bp_num; i++) {
> +		ocp_write_word(tp, type, bp_index, __le16_to_cpu(type1->bp[i]));
> +		bp_index += 2;
> +	}
> +
> +	bp_en_addr = __le16_to_cpu(type1->bp_en_addr);
> +	if (bp_en_addr)
> +		ocp_write_word(tp, type, bp_en_addr,
> +			       __le16_to_cpu(type1->bp_en_value));
> +
> +	fw_ver_reg = __le16_to_cpu(type1->fw_ver_reg);
> +	if (fw_ver_reg)
> +		ocp_write_byte(tp, MCU_TYPE_USB, fw_ver_reg,
> +			       type1->fw_ver_data);
> +
> +	dev_dbg(&tp->intf->dev, "successfully applied %s\n", type1->info);
> +}
> +
> +static void rtl8152_apply_firmware(struct r8152 *tp)
> +{
> +	struct rtl_fw *rtl_fw = &tp->rtl_fw;
> +	const struct firmware *fw = rtl_fw->fw;
> +	struct fw_header *fw_hdr = (struct fw_header *)fw->data;
> +	int i;
> +
> +	if (IS_ERR_OR_NULL(rtl_fw->fw))
> +		return;
> +
> +	if (rtl_fw->pre_fw)
> +		rtl_fw->pre_fw(tp);
> +
> +	for (i = offsetof(struct fw_header, blocks); i < fw->size;) {
> +		struct fw_block *block = (struct fw_block *)&fw->data[i];
> +
> +		switch (__le32_to_cpu(block->type)) {
> +		case RTL_FW_END:
> +			goto post_fw;
> +		case RTL_FW_PLA:
> +		case RTL_FW_USB:
> +			rtl8152_fw_type_1_apply(tp, (struct fw_type_1 *)block);
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		i += ALIGN(__le32_to_cpu(block->length), 8);
> +	}
> +
> +post_fw:
> +	if (rtl_fw->post_fw)
> +		rtl_fw->post_fw(tp);
> +
> +	strscpy(rtl_fw->version, fw_hdr->version, RTL_VER_SIZE);
> +	dev_info(&tp->intf->dev, "load %s successfully\n", rtl_fw->version);
> +}
> +
> +static void rtl8152_release_firmware(struct r8152 *tp)
> +{
> +	struct rtl_fw *rtl_fw = &tp->rtl_fw;
> +
> +	if (!IS_ERR_OR_NULL(rtl_fw->fw)) {
> +		release_firmware(rtl_fw->fw);
> +		rtl_fw->fw = NULL;
> +	}
> +}
> +
> +static int rtl8152_request_firmware(struct r8152 *tp)
> +{
> +	struct rtl_fw *rtl_fw = &tp->rtl_fw;
> +	long rc;
> +
> +	if (rtl_fw->fw || !rtl_fw->fw_name) {
> +		dev_info(&tp->intf->dev, "skip request firmware\n");
> +		rc = 0;
> +		goto result;
> +	}
> +
> +	rc = request_firmware(&rtl_fw->fw, rtl_fw->fw_name, &tp->intf->dev);
> +	if (rc < 0)
> +		goto result;
> +
> +	rc = rtl8152_check_firmware(tp, rtl_fw);
> +	if (rc < 0)
> +		release_firmware(rtl_fw->fw);
> +
> +result:
> +	if (rc) {
> +		rtl_fw->fw = ERR_PTR(rc);
> +
> +		dev_warn(&tp->intf->dev,
> +			 "unable to load firmware patch %s (%ld)\n",
> +			 rtl_fw->fw_name, rc);
> +	}
> +
> +	return rc;
> +}
> +
>   static void r8152_aldps_en(struct r8152 *tp, bool enable)
>   {
>   	if (enable) {
> @@ -3370,6 +3922,7 @@ static void rtl8152_disable(struct r8152 *tp)
>   
>   static void r8152b_hw_phy_cfg(struct r8152 *tp)
>   {
> +	rtl8152_apply_firmware(tp);
>   	rtl_eee_enable(tp, tp->eee_en);
>   	r8152_aldps_en(tp, true);
>   	r8152b_enable_fc(tp);
> @@ -3524,6 +4077,126 @@ static int r8153_patch_request(struct r8152 *tp, bool request)
>   	}
>   }
>   
> +static int r8153_pre_firmware_1(struct r8152 *tp)
> +{
> +	int i;
> +
> +	/* Wait till the WTD timer is ready. It would take at most 104 ms. */
> +	for (i = 0; i < 104; i++) {
> +		u32 ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_WDT1_CTRL);
> +
> +		if (!(ocp_data & WTD1_EN))
> +			break;
> +		usleep_range(1000, 2000);
> +	}
> +
> +	return 0;
> +}
> +
> +static int r8153_post_firmware_1(struct r8152 *tp)
> +{
> +	/* set USB_BP_4 to support USB_SPEED_SUPER only */
> +	if (ocp_read_byte(tp, MCU_TYPE_USB, USB_CSTMR) & FORCE_SUPER)
> +		ocp_write_word(tp, MCU_TYPE_USB, USB_BP_4, BP4_SUPER_ONLY);
> +
> +	/* reset UPHY timer to 36 ms */
> +	ocp_write_word(tp, MCU_TYPE_PLA, PLA_UPHY_TIMER, 36000 / 16);
> +
> +	return 0;
> +}
> +
> +static int r8153_pre_firmware_2(struct r8152 *tp)
> +{
> +	u32 ocp_data;
> +
> +	r8153_pre_firmware_1(tp);
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN0);
> +	ocp_data &= ~FW_FIX_SUSPEND;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN0, ocp_data);
> +
> +	return 0;
> +}
> +
> +static int r8153_post_firmware_2(struct r8152 *tp)
> +{
> +	u32 ocp_data;
> +
> +	/* enable bp0 if support USB_SPEED_SUPER only */
> +	if (ocp_read_byte(tp, MCU_TYPE_USB, USB_CSTMR) & FORCE_SUPER) {
> +		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_BP_EN);
> +		ocp_data |= BIT(0);
> +		ocp_write_word(tp, MCU_TYPE_PLA, PLA_BP_EN, ocp_data);
> +	}
> +
> +	/* reset UPHY timer to 36 ms */
> +	ocp_write_word(tp, MCU_TYPE_PLA, PLA_UPHY_TIMER, 36000 / 16);
> +
> +	/* enable U3P3 check, set the counter to 4 */
> +	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, U3P3_CHECK_EN | 4);
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN0);
> +	ocp_data |= FW_FIX_SUSPEND;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN0, ocp_data);
> +
> +	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_USB2PHY);
> +	ocp_data |= USB2PHY_L1 | USB2PHY_SUSPEND;
> +	ocp_write_byte(tp, MCU_TYPE_USB, USB_USB2PHY, ocp_data);
> +
> +	return 0;
> +}
> +
> +static int r8153_post_firmware_3(struct r8152 *tp)
> +{
> +	u32 ocp_data;
> +
> +	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_USB2PHY);
> +	ocp_data |= USB2PHY_L1 | USB2PHY_SUSPEND;
> +	ocp_write_byte(tp, MCU_TYPE_USB, USB_USB2PHY, ocp_data);
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1);
> +	ocp_data |= FW_IP_RESET_EN;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1, ocp_data);
> +
> +	return 0;
> +}
> +
> +static int r8153b_pre_firmware_1(struct r8152 *tp)
> +{
> +	/* enable fc timer and set timer to 1 second. */
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FC_TIMER,
> +		       CTRL_TIMER_EN | (1000 / 8));
> +
> +	return 0;
> +}
> +
> +static int r8153b_post_firmware_1(struct r8152 *tp)
> +{
> +	u32 ocp_data;
> +
> +	/* enable bp0 for RTL8153-BND */
> +	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_1);
> +	if (ocp_data & BND_MASK) {
> +		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_BP_EN);
> +		ocp_data |= BIT(0);
> +		ocp_write_word(tp, MCU_TYPE_PLA, PLA_BP_EN, ocp_data);
> +	}
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_CTRL);
> +	ocp_data |= FLOW_CTRL_PATCH_OPT;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_CTRL, ocp_data);
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_TASK);
> +	ocp_data |= FC_PATCH_TASK;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
> +
> +	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1);
> +	ocp_data |= FW_IP_RESET_EN;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1, ocp_data);
> +
> +	return 0;
> +}
> +
>   static void r8153_aldps_en(struct r8152 *tp, bool enable)
>   {
>   	u16 data;
> @@ -3558,6 +4231,8 @@ static void r8153_hw_phy_cfg(struct r8152 *tp)
>   	/* disable EEE before updating the PHY parameters */
>   	rtl_eee_enable(tp, false);
>   
> +	rtl8152_apply_firmware(tp);
> +
>   	if (tp->version == RTL_VER_03) {
>   		data = ocp_reg_read(tp, OCP_EEE_CFG);
>   		data &= ~CTAP_SHORT_EN;
> @@ -3630,6 +4305,8 @@ static void r8153b_hw_phy_cfg(struct r8152 *tp)
>   	/* disable EEE before updating the PHY parameters */
>   	rtl_eee_enable(tp, false);
>   
> +	rtl8152_apply_firmware(tp);
> +
>   	r8153b_green_en(tp, test_bit(GREEN_ETHERNET, &tp->flags));
>   
>   	data = sram_read(tp, SRAM_GREEN_CFG);
> @@ -4156,11 +4833,22 @@ static void rtl_hw_phy_work_func_t(struct work_struct *work)
>   
>   	mutex_lock(&tp->control);
>   
> +	if (rtl8152_request_firmware(tp) == -ENODEV && tp->rtl_fw.retry) {
> +		tp->rtl_fw.retry = false;
> +		tp->rtl_fw.fw = NULL;
> +
> +		/* Delay execution in case request_firmware() is not ready yet.
> +		 */
> +		queue_delayed_work(system_long_wq, &tp->hw_phy_work, HZ * 10);
> +		goto ignore_once;
> +	}
> +
>   	tp->rtl_ops.hw_phy_cfg(tp);
>   
>   	rtl8152_set_speed(tp, tp->autoneg, tp->speed, tp->duplex,
>   			  tp->advertising);
>   
> +ignore_once:
>   	mutex_unlock(&tp->control);
>   
>   	usb_autopm_put_interface(tp->intf);
> @@ -4198,6 +4886,11 @@ static int rtl8152_open(struct net_device *netdev)
>   	struct r8152 *tp = netdev_priv(netdev);
>   	int res = 0;
>   
> +	if (work_busy(&tp->hw_phy_work.work) & WORK_BUSY_PENDING) {
> +		cancel_delayed_work_sync(&tp->hw_phy_work);
> +		rtl_hw_phy_work_func_t(&tp->hw_phy_work.work);
> +	}
> +
>   	res = alloc_all_mem(tp);
>   	if (res)
>   		goto out;
> @@ -4844,6 +5537,9 @@ static void rtl8152_get_drvinfo(struct net_device *netdev,
>   	strlcpy(info->driver, MODULENAME, sizeof(info->driver));
>   	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
>   	usb_make_path(tp->udev, info->bus_info, sizeof(info->bus_info));
> +	if (!IS_ERR_OR_NULL(tp->rtl_fw.fw))
> +		strlcpy(info->fw_version, tp->rtl_fw.version,
> +			sizeof(info->fw_version));
>   }
>   
>   static
> @@ -5468,6 +6164,47 @@ static int rtl_ops_init(struct r8152 *tp)
>   	return ret;
>   }
>   
> +#define FIRMWARE_8153A_2	"rtl_nic/rtl8153a-2.fw"
> +#define FIRMWARE_8153A_3	"rtl_nic/rtl8153a-3.fw"
> +#define FIRMWARE_8153A_4	"rtl_nic/rtl8153a-4.fw"
> +#define FIRMWARE_8153B_2	"rtl_nic/rtl8153b-2.fw"
> +
> +MODULE_FIRMWARE(FIRMWARE_8153A_2);
> +MODULE_FIRMWARE(FIRMWARE_8153A_3);
> +MODULE_FIRMWARE(FIRMWARE_8153A_4);
> +MODULE_FIRMWARE(FIRMWARE_8153B_2);
> +
> +static int rtl_fw_init(struct r8152 *tp)
> +{
> +	struct rtl_fw *rtl_fw = &tp->rtl_fw;
> +
> +	switch (tp->version) {
> +	case RTL_VER_04:
> +		rtl_fw->fw_name		= FIRMWARE_8153A_2;
> +		rtl_fw->pre_fw		= r8153_pre_firmware_1;
> +		rtl_fw->post_fw		= r8153_post_firmware_1;
> +		break;
> +	case RTL_VER_05:
> +		rtl_fw->fw_name		= FIRMWARE_8153A_3;
> +		rtl_fw->pre_fw		= r8153_pre_firmware_2;
> +		rtl_fw->post_fw		= r8153_post_firmware_2;
> +		break;
> +	case RTL_VER_06:
> +		rtl_fw->fw_name		= FIRMWARE_8153A_4;
> +		rtl_fw->post_fw		= r8153_post_firmware_3;
> +		break;
> +	case RTL_VER_09:
> +		rtl_fw->fw_name		= FIRMWARE_8153B_2;
> +		rtl_fw->pre_fw		= r8153b_pre_firmware_1;
> +		rtl_fw->post_fw		= r8153b_post_firmware_1;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   static u8 rtl_get_version(struct usb_interface *intf)
>   {
>   	struct usb_device *udev = interface_to_usbdev(intf);
> @@ -5575,6 +6312,8 @@ static int rtl8152_probe(struct usb_interface *intf,
>   	if (ret)
>   		goto out;
>   
> +	rtl_fw_init(tp);
> +
>   	mutex_init(&tp->control);
>   	INIT_DELAYED_WORK(&tp->schedule, rtl_work_func_t);
>   	INIT_DELAYED_WORK(&tp->hw_phy_work, rtl_hw_phy_work_func_t);
> @@ -5646,6 +6385,10 @@ static int rtl8152_probe(struct usb_interface *intf,
>   	intf->needs_remote_wakeup = 1;
>   
>   	tp->rtl_ops.init(tp);
> +#if IS_BUILTIN(CONFIG_USB_RTL8152)
> +	/* Retry in case request_firmware() is not ready yet. */
> +	tp->rtl_fw.retry = true;
> +#endif
>   	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
>   	set_ethernet_addr(tp);
>   
> @@ -5691,6 +6434,7 @@ static void rtl8152_disconnect(struct usb_interface *intf)
>   		tasklet_kill(&tp->tx_tl);
>   		cancel_delayed_work_sync(&tp->hw_phy_work);
>   		tp->rtl_ops.unload(tp);
> +		rtl8152_release_firmware(tp);
>   		free_netdev(tp->netdev);
>   	}
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

