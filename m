Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF47C50BB5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Jun 2019 15:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbfFXNTJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Jun 2019 09:19:09 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53652 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbfFXNTI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 09:19:08 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190624131906euoutp025b1d030419f8253048a01ce60e1e405b~rJPjVanHa3036030360euoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2019 13:19:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190624131906euoutp025b1d030419f8253048a01ce60e1e405b~rJPjVanHa3036030360euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561382347;
        bh=qeIgxpBh4XpIhF8fLol5EjhiufAt9+w5zpONIuxq8PY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=WzhAs9bRX9ULXZKu26Opkk9dK889nnVYky13ZKWQBohcWUjw7+M6RFPH/qlEeJmdE
         Dwt0UZhkKbPT1kyC5jA8RytHvht3+0kdz4dPxgRKk/iQ9GR21GgTXZMmY6/c/ekzNr
         k0qPualpRHPDUKeXnprW+3WVfH4HLPZsglMdLzQ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190624131906eucas1p202eba20c57bbef91b6bd95ce524c2135~rJPi5DnAz0802308023eucas1p23;
        Mon, 24 Jun 2019 13:19:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B4.D9.04298.ACDC01D5; Mon, 24
        Jun 2019 14:19:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c~rJPiHjOd00771707717eucas1p26;
        Mon, 24 Jun 2019 13:19:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190624131905eusmtrp138f2754e181c96e6f55bf072898ab88a~rJPh5hgU-1728617286eusmtrp1i;
        Mon, 24 Jun 2019 13:19:05 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-be-5d10cdcab5ff
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 93.81.04140.9CDC01D5; Mon, 24
        Jun 2019 14:19:05 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190624131905eusmtip1559711d9d8b3f7388156013c63dd8b8b~rJPhhxPfm2840528405eusmtip1F;
        Mon, 24 Jun 2019 13:19:04 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <9cfc8505-2903-033f-f68b-8ccc1c70132b@samsung.com>
Date:   Mon, 24 Jun 2019 15:19:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7qnzgrEGlw4wmNx5eIhJoupD5+w
        WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUVw2
        Kak5mWWpRfp2CVwZV8+/Yiw4L17x5ddOpgbGdcJdjJwcEgImEge2v2XtYuTiEBJYwSjxbPNJ
        dgjnC6PEif/bmCGcz4wSM579ZYVpWfzvKxtEYjmjxMNlW6Cq3jJKfPy4iw2kSlggXaKj8yNL
        FyMHh4hAtMT103YgYWaBvYwSVxcrgthsAoYSXW+7wMp5Bewkbpzcxw5SziKgKvH/BliJqECM
        xMP5d6BKBCVOznzCAmJzCthKPNjdxAYxUl6ieetsZghbXOLWk/lMIOdICKxil+hvessGcbSL
        RP+7DkYIW1ji1fEt7BC2jMTpyT0sEA3NQM+cW8sO4fQwSlxumgHVYS1x+PhFVpDrmAU0Jdbv
        0ocIO0q8u7+XDSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy
        2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBCae0/+Of9rB+PVS
        0iFGAQ5GJR7eBUcEYoVYE8uKK3MPMUpwMCuJ8C5NBArxpiRWVqUW5ccXleakFh9ilOZgURLn
        rWZ4EC0kkJ5YkpqdmlqQWgSTZeLglGpgTOSQ49Zr/NrsJL6c9/dayaiKg0pXY0qfubb8k7Tu
        qlZcnsW0n6Xhe4+3gC7jvS9qTS+vHZqosLo26w37dvFeXZY656Nvg+YbnBTdUv+zbUWMSuP/
        S/6vpV0t7+dPLqjQaKnKX9s/yf705JBbTjMbM80NWA6HsEYZrj/085J9QObrs7bxl78rsRRn
        JBpqMRcVJwIA8accAzgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xu7onzwrEGpz8Impx5eIhJoupD5+w
        WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZV8+/Yiw4
        L17x5ddOpgbGdcJdjJwcEgImEov/fWXrYuTiEBJYyihxfuoKNoiEjMTJaQ2sELawxJ9rXVBF
        rxklpnXsZwJJCAukS3R0fmQBsUUEoiUmL/sPVsQssJ9Rou/TNLBuIYF8ibtL5jCD2GwChhJd
        b7vANvAK2EncOLmPvYuRg4NFQFXi/w1FkLCoQIxE19SfLBAlghInZz4BszkFbCUe7G4Ca2UW
        MJOYt/khM4QtL9G8dTaULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kV
        J+YWl+al6yXn525iBMbatmM/t+xg7HoXfIhRgINRiYd3wRGBWCHWxLLiytxDjBIczEoivEsT
        gUK8KYmVValF+fFFpTmpxYcYTYF+m8gsJZqcD0wDeSXxhqaG5haWhubG5sZmFkrivB0CB2OE
        BNITS1KzU1MLUotg+pg4OKUaGO2X2d4QqTsqU7lXNPtKmXzxycXvlqW0ifr5x9wVst26tSgq
        SeO24LPthhyOD05uWrlOwvLRts0vbI+bVF389NiGd6ZV3OdF5xcY54sHmSZX2dh13HVf/EdV
        RGymiCUT4+Tvk+zCKyc8NK1+XFE/W3K30IN+oSDVn/ozsrOrzgWsnXh55amvb5RYijMSDbWY
        i4oTAbOSP9vLAgAA
X-CMS-MailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
References: <877e9iwf9f.wl-kuninori.morimoto.gx@renesas.com>
        <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
        <CGME20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 2019-06-19 03:18, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> ALSA SoC is now supporting "no Platform". Sound card doesn't need to
> select "CPU component" as "Platform" anymore if it doesn't need
> special Platform.
> This patch removes such settings.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch causes regression on Samsung Exynos-based boards: Snow, 
Peach-Pi and Peach-Pit (all that use snow machine driver) since linux 
next-20190620. ASoC device is properly registered, but it is not usable:

[    3.203006] samsung-i2s 3830000.i2s-sec: DMA channels sourced from 
device 3830000.i2s
[    3.213440] snow-audio sound: Failed parsing codec node
[    3.423241] snow-audio sound: multicodec <-> samsung-i2s mapping ok
[    3.429776] max98095 7-0011: ASoC: mux External MIC has no paths
[    3.434513] max98095 7-0011: ASoC: mux Linein Mux has no paths
[    4.043488] ALSA device list:
[    4.047171]   #0: Snow-I2S-MAX98095

# speaker-test -l1

speaker-test 1.1.3

Playback device is default
Stream parameters are 48000Hz, S16_LE, 1 channels
Using 16 octaves of pink noise
Playback open error: -22,Invalid argument

#

The kernel logs are exactly the same whem it worked fine (i.e. 
next-20190619, so the message about codec node can be ignored).

Similar issue appears also on Hardkernel's OdroidXU board 
(Exynos5410-based, uses sound-card-simple ASoC driver) and Samsung TM2 
board (Exynos5433, uses tm2_wm5110 driver). I'm open to test any patch 
or provide more logs if needed.

> ---
>   sound/soc/samsung/snow.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
> index 8ea7799..7d669c4 100644
> --- a/sound/soc/samsung/snow.c
> +++ b/sound/soc/samsung/snow.c
> @@ -14,9 +14,9 @@
>   
>   #define FIN_PLL_RATE		24000000
>   
> -SND_SOC_DAILINK_DEFS(links,
> -	DAILINK_COMP_ARRAY(COMP_EMPTY()),
> -	DAILINK_COMP_ARRAY(COMP_EMPTY()),
> +SND_SOC_DAILINK_DEF(links_cpus,
> +	DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +SND_SOC_DAILINK_DEF(links_codecs,
>   	DAILINK_COMP_ARRAY(COMP_EMPTY()));
>   
>   struct snow_priv {
> @@ -150,8 +150,6 @@ static int snow_probe(struct platform_device *pdev)
>   	link->num_cpus = ARRAY_SIZE(links_cpus);
>   	link->codecs = links_codecs;
>   	link->num_codecs = ARRAY_SIZE(links_codecs);
> -	link->platforms = links_platforms;
> -	link->num_platforms = ARRAY_SIZE(links_platforms);
>   
>   	card->dai_link = link;
>   	card->num_links = 1;
> @@ -207,8 +205,6 @@ static int snow_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	link->platforms->of_node = link->cpus->of_node;
> -
>   	/* Update card-name if provided through DT, else use default name */
>   	snd_soc_of_parse_card_name(card, "samsung,model");
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

