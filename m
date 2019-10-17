Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBE1DA85F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 11:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439456AbfJQJc3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 17 Oct 2019 05:32:29 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:2164 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393479AbfJQJc2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 05:32:28 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: RiPCekASyK4XX90kgCguTCZ6Fewhru0nFfg686muQ+X+vlhkeieyRjrnEUVS3yVAzWUE6DVNG+
 GbSV9HVpkfwpF5mY5RfpApF4VBMWZ6Nxn4Q20rPm7PF5NNjQ5Cpi7M9xdDogU32xpnXuMWJm0n
 3t1QxTxeSK2r8AE+Fb7kj5deB6wBEHEx99oxp3Qz0lElf95HmZxlZUQrQNXL1fWFtxS0DWquEo
 AGwgYe+DhTVb79+g3k+w7BNGS4y2GVg7aRO4olJlG4V4OVjeRqhLz2OBHRZLPchMQ6XbubaumY
 geg=
X-IronPort-AV: E=Sophos;i="5.67,307,1566889200"; 
   d="scan'208";a="51838929"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Oct 2019 02:32:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Oct 2019 02:32:10 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 02:32:10 -0700
Date:   Thu, 17 Oct 2019 11:32:37 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     YueHaibing <yuehaibing@huawei.com>
CC:     <herbert@gondor.apana.org.au>, <mpm@selenic.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <f.fainelli@gmail.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <eric@anholt.net>,
        <wahrenst@gmx.net>, <l.stelmach@samsung.com>, <kgene@kernel.org>,
        <krzk@kernel.org>, <khilman@baylibre.com>, <dsaxena@plexity.net>,
        <patrice.chotard@st.com>, <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH -next 01/13] hwrng: atmel - use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017093237.3poaq7unlm62mhwt@M43218.corp.atmel.com>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
        herbert@gondor.apana.org.au, mpm@selenic.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, eric@anholt.net,
        wahrenst@gmx.net, l.stelmach@samsung.com, kgene@kernel.org,
        krzk@kernel.org, khilman@baylibre.com, dsaxena@plexity.net,
        patrice.chotard@st.com, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20191016104621.26056-1-yuehaibing@huawei.com>
 <20191016104621.26056-2-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191016104621.26056-2-yuehaibing@huawei.com>
User-Agent: NeoMutt/20180716
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 06:46:09PM +0800, YueHaibing wrote:
> External E-Mail
> 
> 
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> ---
>  drivers/char/hw_random/atmel-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> index e557057..b3138ec2 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -62,15 +62,13 @@ static void atmel_trng_disable(struct atmel_trng *trng)
>  static int atmel_trng_probe(struct platform_device *pdev)
>  {
>  	struct atmel_trng *trng;
> -	struct resource *res;
>  	int ret;
>  
>  	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
>  	if (!trng)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	trng->base = devm_ioremap_resource(&pdev->dev, res);
> +	trng->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(trng->base))
>  		return PTR_ERR(trng->base);
>  
> -- 
> 2.7.4
> 
> 
> 
