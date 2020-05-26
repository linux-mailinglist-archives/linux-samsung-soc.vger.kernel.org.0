Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C69A1D04CB
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 13 May 2020 04:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgEMCUM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 12 May 2020 22:20:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55744 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgEMCUM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 May 2020 22:20:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04D2K6vR088175;
        Tue, 12 May 2020 21:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589336406;
        bh=Sdc3TdTbuYOPOfJZXuUSuJdF1dRZ85M5NGFRxv0KYEk=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=NZBwK9URSFM2QpTLdbw/qAwfCHCiHkp+We2btpd4owNMx0ycWyE73reY0jCPR9MzA
         K/CUgBv5Mf8sFW5R+/kvyqbaIu/r2AaAD5Bs5S5zN8klrob4EPTaJ6LvZnlnut6gyC
         WNZRaN4Bo0ndwJE/lT1aNQoJyKT5V3COTIH2/BnI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04D2K6Hw094961;
        Tue, 12 May 2020 21:20:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 21:20:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 21:20:05 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04D2K3Fn012306;
        Tue, 12 May 2020 21:20:03 -0500
Subject: Re: [PATCH] phy: samsung: s5pv210-usb2: Add delay after reset
To:     Jonathan Bakker <xc-racer2@live.ca>,
        <linux-kernel@vger.kernel.org>, <s.nawrocki@samsung.com>,
        <kamil@wypas.org>, <krzk@kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <BN6PR04MB06605D52502816E500683553A3D10@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <bf13f752-8665-1d6a-00b9-085adc2c3881@ti.com>
Date:   Wed, 13 May 2020 07:50:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB06605D52502816E500683553A3D10@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 4/25/2020 11:06 PM, Jonathan Bakker wrote:
> The USB phy takes some time to reset, so make sure we give it to it. The
> delay length was taken from the 4x12 phy driver.
> 
> This manifested in issues with the DWC2 driver since commit fe369e1826b3
> ("usb: dwc2: Make dwc2_readl/writel functions endianness-agnostic.")
> where the endianness check would read the DWC ID as 0 due to the phy still
> resetting, resulting in the wrong endian mode being chosen.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

merged, thanks!

-Kishon
> ---
>  drivers/phy/samsung/phy-s5pv210-usb2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-s5pv210-usb2.c b/drivers/phy/samsung/phy-s5pv210-usb2.c
> index 56a5083fe6f9..32be62e49804 100644
> --- a/drivers/phy/samsung/phy-s5pv210-usb2.c
> +++ b/drivers/phy/samsung/phy-s5pv210-usb2.c
> @@ -139,6 +139,10 @@ static void s5pv210_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
>  		udelay(10);
>  		rst &= ~rstbits;
>  		writel(rst, drv->reg_phy + S5PV210_UPHYRST);
> +		/* The following delay is necessary for the reset sequence to be
> +		 * completed
> +		 */
> +		udelay(80);
>  	} else {
>  		pwr = readl(drv->reg_phy + S5PV210_UPHYPWR);
>  		pwr |= phypwr;
> 
