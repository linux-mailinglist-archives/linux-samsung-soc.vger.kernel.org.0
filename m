Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3B5526C7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jun 2019 10:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbfFYIhk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 25 Jun 2019 04:37:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54293 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfFYIhk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 04:37:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190625083738euoutp024d20a3a496dec7ddda1cfd8c346ce6ba~rZDEvnlI_1557915579euoutp025
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2019 08:37:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190625083738euoutp024d20a3a496dec7ddda1cfd8c346ce6ba~rZDEvnlI_1557915579euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561451858;
        bh=gUu1qsugbXLl7Y57N5vJ22G83Wm3d4LP+lI00mJSLcM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=SpWNY5IW3dSuEcQXLiZWpNM1sYrYihlA6jbVy5oRw4b8pQjLNSjwB7l+LNABplUd1
         dTC5qvJ9ZhvMVDoketMDroY/eVWnUSvCpwlRH8pQ7A/dZIUGLbikE9wIhKeH5FM66G
         tTA28HrTSmqkSfbywrK/8U8fljWY2YQdUGvDpoJU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190625083737eucas1p23a40597cdfe362ff3dd59803538ec942~rZDEOiz4I0854908549eucas1p2B;
        Tue, 25 Jun 2019 08:37:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 2A.A9.04298.15DD11D5; Tue, 25
        Jun 2019 09:37:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190625083736eucas1p22826431f49ee09a9a10854135d8daf7a~rZDDiU73c1982019820eucas1p2m;
        Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190625083736eusmtrp1f0610bf8870a7154deba28afc3769434~rZDDUQ4Nq1447714477eusmtrp1V;
        Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-49-5d11dd51e6f9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 43.28.04140.05DD11D5; Tue, 25
        Jun 2019 09:37:36 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190625083736eusmtip264612efb5d2fcb40b976e028ba6f4085~rZDC93EJL1363613636eusmtip2y;
        Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c4bb4599-e5d5-926b-75d5-d5c349ed8076@samsung.com>
Date:   Tue, 25 Jun 2019 10:37:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <877e9a2hvn.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7qBdwVjDb4ukrS4cvEQk8XUh0/Y
        LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKC6b
        lNSczLLUIn27BK6Mk18sCmbyV7z9tJC5gfEETxcjJ4eEgInEmt6VLF2MXBxCAisYJfb8/sUM
        4XxhlOg7thTK+cwo0db+lBWmpWvJdFaIxHJGiSlta8ESQgJvGSVWT+ECsYUF0iU6Oj+ygNgi
        AhYSLR82g+1gFnjAKLFv0nOwBjYBQ4mut11sIDavgJ3EtfnbwWwWAVWJezs3MoPYogIxEg/n
        34GqEZQ4OfMJ2FBOAVuJdx3z2UFsZgF5ieats5khbHGJW0/mM4EskxBYxS6x7fAPNoizXSTe
        L/jKAmELS7w6voUdwpaROD25hwWioZlR4uG5tewQTg+jxOWmGYwQVdYSh49fBDqbA2iFpsT6
        XfoQYUeJd/f3soGEJQT4JG68FYQ4gk9i0rbpzBBhXomONiGIajWJWcfXwa09eOES8wRGpVlI
        XpuF5J1ZSN6ZhbB3ASPLKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMDUc/rf8U87GL9e
        SjrEKMDBqMTDu+CIQKwQa2JZcWXuIUYJDmYlEd6liUAh3pTEyqrUovz4otKc1OJDjNIcLEri
        vNUMD6KFBNITS1KzU1MLUotgskwcnFINjFkV0Z4GjHtNvl2bGGvxmHFPbYZLr1ih6afL9x6q
        KfRN2++//PDuBfqPd3s/WVf93OHJS5vVP3eVyDHP8WA+03zbZTnjp3vqq1vu/C1lXRjzZnpR
        2dr4D10fc9evmiRRG//A1JK5KvFe2xq5AEWGn641Ppzpt1RNCtmvhb6J1GjlzO5au+fiLiWW
        4oxEQy3mouJEAFgYZXU5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7oBdwVjDc4+VLe4cvEQk8XUh0/Y
        LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mk18sCmby
        V7z9tJC5gfEETxcjJ4eEgIlE15LprCC2kMBSRonpt8Uh4jISJ6c1sELYwhJ/rnWxdTFyAdW8
        ZpS49+YiE0hCWCBdoqPzIwuILSJgIdHyYTMLSBGzwANGiWtvX0J1TGaWuN2+CqyKTcBQoust
        yChODl4BO4lr87eD2SwCqhL3dm5kBrFFBWIkuqb+ZIGoEZQ4OfMJmM0pYCvxrmM+O4jNLGAm
        MW/zQ2YIW16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07M
        LS7NS9dLzs/dxAiMtW3Hfm7Zwdj1LvgQowAHoxIP74IjArFCrIllxZW5hxglOJiVRHiXJgKF
        eFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YBvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmk
        J5akZqemFqQWwfQxcXBKNTCekv2VZrw/yuqLm+uz4srgZ3el3Cp3XnrPP/twz5UDXn7H7l36
        a8yk/neL4gGuqmW8d4+slf/u180580i8QqZ5Y17OtS9L+59J7eTJnlX1edU86ZR5P96fF0pJ
        Xm6UKf+mqKbXYUuWsVXQv6w0Zol1JdwObfpndl84Vj2hzPHUhPNK+Y/uTytSYinOSDTUYi4q
        TgQAkNqV9ssCAAA=
X-CMS-MailID: 20190625083736eucas1p22826431f49ee09a9a10854135d8daf7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
References: <877e9iwf9f.wl-kuninori.morimoto.gx@renesas.com>
        <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
        <CGME20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c@eucas1p2.samsung.com>
        <9cfc8505-2903-033f-f68b-8ccc1c70132b@samsung.com>
        <87d0j232wg.wl-kuninori.morimoto.gx@renesas.com>
        <80c5c575-6f28-c6a6-91b2-d701bb9fbce8@samsung.com>
        <877e9a2hvn.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Kuninori,

On 2019-06-25 10:25, Kuninori Morimoto wrote:
>>> I have no idea so far, but one capability is that if your system
>>> used / based dummy platform, and if your CPU driver didn't use/have
>>> snd_soc_set_runtime_hwparams() / snd_pcm_lib_ioctl,
>>> it might be happen, but this patch seems not related to it...
>> Reverting this patch fixes the issue, so it is definitely related somehow.
> Ahh... OK now I think I could understand your issue.
> Your CPU is using devm_snd_dmaengine_pcm_register() with same *dev.
> In such case, indeed this patch breaks sound card.
>
> Can I confirm it ?
> In local email, I asked printing component name list.
> Can you please replace it to below ?
> I think disappear component is "snd_dmaengine_pcm".
> If so, above my patch is the bug.
>
> ---------------------------
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 4cd77cd..4b1f8ae 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -313,6 +313,7 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
>   	new_rtdcom->component = component;
>   	INIT_LIST_HEAD(&new_rtdcom->list);
>   
> +	printk("-----%s : %s\n", component->name, component->driver->name);
>   	list_add_tail(&new_rtdcom->list, &rtd->component_list);
>   
>   	return 0;
> ---------------------------
>
> Thank you for your help !!

pure next-20190624:

[    3.549712] -----3830000.i2s : samsung-i2s
[    3.767732] -----max98095.7-0011 : (null)
[    3.986370] -----hdmi-audio-codec.3.auto : (null)

next-20190624 + Revert "ASoC: samsung: snow: don't select unnecessary 
Platform":

[    3.508391] -----3830000.i2s : samsung-i2s
[    3.726332] -----max98095.7-0011 : (null)
[    3.944906] -----hdmi-audio-codec.3.auto : (null)
[    4.376639] -----3830000.i2s : snd_dmaengine_pcm


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

