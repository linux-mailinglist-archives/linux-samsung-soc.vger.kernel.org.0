Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31698522DD
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jun 2019 07:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfFYFgl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:36:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59100 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfFYFgl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:36:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190625053639euoutp01c408677511937eb8d08bd40dc941dc3e~rWlDzRS9o1980519805euoutp011
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2019 05:36:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190625053639euoutp01c408677511937eb8d08bd40dc941dc3e~rWlDzRS9o1980519805euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561440999;
        bh=uScNoZesmYLMa3NIs+nFiJ45ln9qRAf3qeTJ8h9cAa4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TMtAzmaCR5qSnPT7RAxIpyNod0Zy95wNqFNOytBSV10du48MiWIxpOP8OGvC3Ne1i
         4gPHkq9lGoeYHEa/CN9hm/rNX4Ae2UQZfvSl8hZtejYnfqzvEcuMUnRPDU11ovoIUU
         y/4Iygv8Wxc7XUv+OmAFI1YGRvsggkaNPppmEv+4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190625053639eucas1p26f858a1e1a05a9ac8b0271146ac106b2~rWlDW5XLV2882428824eucas1p2M;
        Tue, 25 Jun 2019 05:36:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.51.04298.6E2B11D5; Tue, 25
        Jun 2019 06:36:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190625053638eucas1p1e4bcdf8a627054556921f5929f5b0b58~rWlCkYCO62894228942eucas1p1R;
        Tue, 25 Jun 2019 05:36:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190625053637eusmtrp26c1c1037468d691a0f92a7fda318adab~rWlCWTOAU2961529615eusmtrp2L;
        Tue, 25 Jun 2019 05:36:37 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-96-5d11b2e6e16c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.92.04140.5E2B11D5; Tue, 25
        Jun 2019 06:36:37 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190625053637eusmtip1da623b534cee562b5f28d902611293d1~rWlCBtXbJ0323303233eusmtip1b;
        Tue, 25 Jun 2019 05:36:37 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <80c5c575-6f28-c6a6-91b2-d701bb9fbce8@samsung.com>
Date:   Tue, 25 Jun 2019 07:36:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87d0j232wg.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7rPNgnGGsw6om1x5eIhJoupD5+w
        WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUVw2
        Kak5mWWpRfp2CVwZH57MYC9Yzl+xbsELpgbGAzxdjJwcEgImEmcOLGHsYuTiEBJYwSjRvXsl
        K4TzhVHi2s6DUM5nRonVX/exwrQ8fHsZqmU5o8TambvYIZy3jBLfOx6AVQkLpEt0dH5kAbFF
        BCwkWj5sZgEpYhZ4wCixb9JzsCI2AUOJrrddbCA2r4CdxL+525hBbBYBVYkdH1+yg9iiAjES
        D+ffgaoRlDg58wnYUE4BW4kXRzrAbGYBeYnmrbOZIWxxiVtP5jOBLJMQWMUusXr9RXaIu10k
        lrx8wAhhC0u8Or4FKi4j8X8nTEMzo8TDc2vZIZweRonLTTOgOqwlDh+/CHQ2B9AKTYn1u/Qh
        wo4S7+7vZQMJSwjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQvDYL
        yTuzkLwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIHp5/S/4592MH69lHSI
        UYCDUYmHd8ERgVgh1sSy4srcQ4wSHMxKIrxLE4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZ
        HkQLCaQnlqRmp6YWpBbBZJk4OKUaGI3qNL4HqIuW7sgw9LH/kXYq9cbjozN3zWi7ePWl29rV
        D2Xv9ZzUcuiMrPE21fBQ+5Z06d79L1NWNrKIb3gfcvSt6af49TY2DKcN7v9qyBFkvFFS980n
        zL5tUu6RrTcV/+emXXjbevp6MTvjw1i2ul2ZD2z2/puyWp2pV+F7ck+C3dp3HDnXNiixFGck
        GmoxFxUnAgAxnvDXOwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xu7pPNwnGGtz8ZWVx5eIhJoupD5+w
        WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZH57MYC9Y
        zl+xbsELpgbGAzxdjJwcEgImEg/fXmbsYuTiEBJYyihxrf0LI0RCRuLktAZWCFtY4s+1LjaI
        oteMEs1rr4MlhAXSJTo6P7KA2CICFhItHzazgBQxCzwAmvT2JRtIQkhgNZPExWuiIDabgKFE
        19susDivgJ3Ev7nbmEFsFgFViR0fX7KD2KICMRJdU3+yQNQISpyc+QTM5hSwlXhxpAPMZhYw
        k5i3+SEzhC0v0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn
        5haX5qXrJefnbmIERtu2Yz+37GDsehd8iFGAg1GJh3fBEYFYIdbEsuLK3EOMEhzMSiK8SxOB
        QrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAR5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE
        0hNLUrNTUwtSi2D6mDg4pRoYKyuEP3JFs118tkeqpN6ZPezktQ0FT3TPmj/yvDyfn9H/Q3fU
        jk2z6h++3PM6s5Z/KveTwxUut1/ce9Ect+r7k+RFWVPcpsvx3D/8pmDt8g1+hzZrrai5J7h9
        dnirD5N1OLPgmpU3JmV/uRXOx6U7iVWco2lZS73j+dyN5dwuF65YLhOYe/fxfCWW4oxEQy3m
        ouJEAJL46NrMAgAA
X-CMS-MailID: 20190625053638eucas1p1e4bcdf8a627054556921f5929f5b0b58
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Kuninor

On 2019-06-25 02:51, Kuninori Morimoto wrote:
> Hi Marek
>
> Thank you for your report.
>
>>> ALSA SoC is now supporting "no Platform". Sound card doesn't need to
>>> select "CPU component" as "Platform" anymore if it doesn't need
>>> special Platform.
>>> This patch removes such settings.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> This patch causes regression on Samsung Exynos-based boards: Snow,
>> Peach-Pi and Peach-Pit (all that use snow machine driver) since linux
>> next-20190620. ASoC device is properly registered, but it is not usable:
>>
>> [    3.203006] samsung-i2s 3830000.i2s-sec: DMA channels sourced from
>> device 3830000.i2s
>> [    3.213440] snow-audio sound: Failed parsing codec node
>> [    3.423241] snow-audio sound: multicodec <-> samsung-i2s mapping ok
>> [    3.429776] max98095 7-0011: ASoC: mux External MIC has no paths
>> [    3.434513] max98095 7-0011: ASoC: mux Linein Mux has no paths
>> [    4.043488] ALSA device list:
>> [    4.047171]   #0: Snow-I2S-MAX98095
>>
>> # speaker-test -l1
>>
>> speaker-test 1.1.3
>>
>> Playback device is default
>> Stream parameters are 48000Hz, S16_LE, 1 channels
>> Using 16 octaves of pink noise
>> Playback open error: -22,Invalid argument
> Hmm.. strange...
> Can you test normal aplay here ? I'm not familiar with speaker-test.

The same issue:

# aplay /usr/share/sounds/alsa/Front_Center.wav
aplay: main:788: audio open error: Invalid argument
#


> I have no idea so far, but one capability is that if your system
> used / based dummy platform, and if your CPU driver didn't use/have
> snd_soc_set_runtime_hwparams() / snd_pcm_lib_ioctl,
> it might be happen, but this patch seems not related to it...

Reverting this patch fixes the issue, so it is definitely related somehow.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

