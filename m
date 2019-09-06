Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688A5AB006
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Sep 2019 03:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbfIFBJ7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 21:09:59 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:58253 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730587AbfIFBJ7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 21:09:59 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190906010956epoutp02ef1039b31b562b2e12673b7a759e319e~BtCB3OD052639826398epoutp02M
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Sep 2019 01:09:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190906010956epoutp02ef1039b31b562b2e12673b7a759e319e~BtCB3OD052639826398epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567732196;
        bh=R/1SBy/e3IUgv5u0E3blonWcx55M0ueMCvMUQqYuNXI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=W+ez4yXcr1jEAV/gdJo67s4b5iV9u7kUQy7qTbCljYIhV9vuL8AOn17ttdlyq3bg+
         fcSDrR56sI4p+K9CgKOhkGfTQVtGczXGeiIE452WCKeazlrqF1iXbuJ7e3cHAVjEmk
         L7dsstmPVRoHO2JRwDuwioRLLwPKocgWfeTGCa9c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190906010956epcas1p1c1096911a058b2d7cefb6165513f113b~BtCBrek3p1072310723epcas1p1Z;
        Fri,  6 Sep 2019 01:09:56 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 46Pfc11XdtzMqYkW; Fri,  6 Sep
        2019 01:09:53 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        FA.DB.04160.1E1B17D5; Fri,  6 Sep 2019 10:09:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20190906010952epcas1p4a1c6399dd744c8d9aa2e60a0d28cec2d~BtB9zf-pj2444024440epcas1p4F;
        Fri,  6 Sep 2019 01:09:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190906010952epsmtrp231d06642f89b1a185ee1e0b3fc349b6d~BtB9yxuoD2286122861epsmtrp2J;
        Fri,  6 Sep 2019 01:09:52 +0000 (GMT)
X-AuditID: b6c32a38-b4bff70000001040-cb-5d71b1e1cd89
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        5C.DD.03706.0E1B17D5; Fri,  6 Sep 2019 10:09:52 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190906010952epsmtip2b8dc82b7a362d61f7327fd5754267c79~BtB9nPvPv2262922629epsmtip2x;
        Fri,  6 Sep 2019 01:09:52 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] ARM: dts: exynos: Add support ARM architected
 timers on Exynos5
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <4616ea91-1b35-4ac4-4a9e-a5002b54fc1a@samsung.com>
Date:   Fri, 6 Sep 2019 10:14:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828121005.29368-2-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3u3l2l5a9ZeTTTeQtKyfQ6V9dQU5IQsrD6p4KlN72ouZe7
        W7SCEoSyWpIIoivp/VrGcmn08IUWZS97sIhCUvQPy7BQs/Ug2naL/O9zzvme3/d3fr9DE6pG
        KoouM1oFi5HXM1So/GZvfFLiUEuFLvllQwjX0uAmuf7+6wrOM/ya5Br6O2XctXsDCu72yT4y
        i8r1uA5TuTfOH8itaXWh3ElPTL58e3l6qcAXCxa1YCwyFZcZSzKY9VsK1hZoVyaziWwat4pR
        G3mDkMHk5OUnrivT+70Z9W5eb/On8nlRZJIy0y0mm1VQl5pEawYjmIv15jTzCpE3iDZjyYoi
        k2E1m5ycovULC8tLXz9/qDC3L9jTXVcnr0Qe1REUQgNOheHWSeIICqVV+BaCa0NuUgomEHR7
        flBSMI2g+ft94l9LfVtdkFW4A8HLkc2S6DOC6TGHv0DT4VgHjuq8gGYe3gs13T+CFgSuRHDp
        aCcZKFA4AbpG31ABDsNx4PUNowArcSZUdb0IauR4CYy6XUGej7fCxGAvKWnmQl/jiDzAIX79
        lzvDwQsROALejpySSRwLVW0ngsaA31EwNulTBC4HOAeqvm2WhgmHjw9aFRJHweR4ByXxPrjS
        d4+SeqsRtHY9J6WCBrou1MkC5xA4Htx3kqR0HNz+2YQk3zkw/tVBSlZKqD7496kXw6vBAZnE
        kXDu0GHqOGKcM6ZxzpjAOWMC53+z00juQgsEs2goEUTWnDrzsz0ouJYJ3C3U/iyvB2EaMbOV
        eMqsU5H8btFu6EFAE8w8pbvFn1IW8/a9gsVUYLHpBbEHaf2PXUtEzS8y+ZfcaC1gtSkajYZL
        ZVdqWZaJUJ7xcToVLuGtQrkgmAXLvz4ZHRJVieh9YY9905Exh5YtW229+vN99N3Ojd4daVPx
        GeFPbN790Sb7+NJFpw56d+p37R/1OdLrf33yNv2OtE7xqgsateVNYax40648yzxZ6AzNvtzL
        bk1bY3QtvRhZcUP14VhHTuH4hk3L+xJP6+wDu7aN1N7Nbg5rn3XO8Sjla8v0U6Y8q42Ri6U8
        m0BYRP4PCgJU7KwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJXvfBxsJYg7UzJC02zljPanH+/AZ2
        i02Pr7FazDi/j8li7ZG77BY755xkdWDz2LSqk81j85J6j74tqxg9Pm+SC2CJ4rJJSc3JLEst
        0rdL4Mq4duEEe8EesYoDkyezNDBuEupi5OSQEDCRmLZ1MjOILSSwm1Fi3YoYiLikxLSLR4Hi
        HEC2sMThw8VdjFxAJW8ZJXb+uAcWFxaIlejp8AEpFxGoAirZygZSwyzQxCix69BHJoiGo4wS
        LRevsYJUsQloSex/cYMNxOYXUJS4+uMxI4jNK2An0bz/IlgNi4CKxIv1q8BsUYEIicM7ZkHV
        CEqcnPmEBcTmBKr/sOsx2NHMAuoSf+ZdgrLFJW49mc8EYctLNG+dzTyBUXgWkvZZSFpmIWmZ
        haRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4LjR0tzBeHlJ/CFGAQ5GJR5e
        gS8FsUKsiWXFlbmHGCU4mJVEeNdvBArxpiRWVqUW5ccXleakFh9ilOZgURLnfZp3LFJIID2x
        JDU7NbUgtQgmy8TBKdXAGBu099ysazauMs/O7r741ltyihFPcRLH3qePBa4/uXdw0kuPrbGr
        OHaZ7fgzQ7vk2FLfpNVXvn489vvtSZGa+mId8wvWnybp7J7GczpL7LHeP9s5tTzTp3In6D1k
        6Xm+YgKnpLDSPocnhWcZ5BlZ8tcYp7RPEVRoPfQs0ozFxIDd5teO9887rJVYijMSDbWYi4oT
        AUjp66iXAgAA
X-CMS-MailID: 20190906010952epcas1p4a1c6399dd744c8d9aa2e60a0d28cec2d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190828121012eucas1p10bac7ebb742d968bca251f21dd3aad11
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
        <CGME20190828121012eucas1p10bac7ebb742d968bca251f21dd3aad11@eucas1p1.samsung.com>
        <20190828121005.29368-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear Marek,

On 19. 8. 28. 오후 9:10, Marek Szyprowski wrote:
> All CortexA7/A15 based Exynos5 SoCs have ARM architected timers, so enable
> support for them directly in the base dtsi. None of the known firmware
> properly configures CNTFRQ arch timer register, so force clock frequency
> to 24MHz, which is the only configuration supported by the remaining
> clock drivers so far.
> 
> Stock firmware for Peach Pit and Pi Chromebooks also doesn't reset
> properly other arch timer registers, so add respective properties
> indicating that. Other Exynos5-based boards behaves correctly in this area,
> what finally allows to enable support for KVM-based virtualization.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
>  arch/arm/boot/dts/exynos54xx.dtsi          | 9 +++++++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index f78db6809cca..77e08a4c7300 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -1064,6 +1064,10 @@
>  	status = "okay";
>  };
>  
> +&timer {
> +	arm,cpu-registers-not-fw-configured;
> +};
> +
>  &tmu_cpu0 {
>  	vtmu-supply = <&ldo10_reg>;
>  };
> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> index 9c3b63b7cac6..02d34957cd83 100644
> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> @@ -45,6 +45,15 @@
>  		status = "disabled";
>  	};
>  
> +	timer: timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <24000000>;
> +	};
> +
>  	soc: soc {
>  		sysram@2020000 {
>  			compatible = "mmio-sram";
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index e0f470fe54c8..5e8cec736444 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -1033,6 +1033,10 @@
>  	status = "okay";
>  };
>  
> +&timer {
> +	arm,cpu-registers-not-fw-configured;
> +};
> +
>  &tmu_cpu0 {
>  	vtmu-supply = <&ldo10_reg>;
>  };
> 

I tested it on odroid-xu3 to enable arch-timer for KVM.
In result, I could just initialize KVM on xu3 without problem.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
