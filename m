Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A8AB7A84
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 15:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390002AbfISNbL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 09:31:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54811 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389999AbfISNbL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 09:31:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190919133108euoutp018d046107a02eee5a778cf0c99fedb634~F2h5EFTnI1585915859euoutp01p
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2019 13:31:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190919133108euoutp018d046107a02eee5a778cf0c99fedb634~F2h5EFTnI1585915859euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568899868;
        bh=FopNKHLEgXvbDmvlUkEcgTZYoBFpfDf+Gxyck3rMI64=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fS+IYWDkL7UcIoHUx8jvazOe2cXyEEIJ4urwgwNV3mP7DUJjgSofNQEV5krvRm2K5
         jK34AAHm2cksajUoJCaes2U2Qwymxra9xK0/euSnulCGD0LwUJCp5hNsWYLkH6PLKJ
         kvLBIS4aXb/4ilZHSb0ODPdoibWcsIs7PY2f3GoQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190919133107eucas1p29c81b0ad1d1a6a82d863b41a661ec2a4~F2h4VBsVA0541405414eucas1p2U;
        Thu, 19 Sep 2019 13:31:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8E.24.04469.B13838D5; Thu, 19
        Sep 2019 14:31:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190919133107eucas1p1f9502dca0c106fb9e268f2636b6ec774~F2h3lT5LF2235322353eucas1p1e;
        Thu, 19 Sep 2019 13:31:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190919133106eusmtrp2c59c51ddc76296b5bdc00cb72bb23539~F2h3XKIuM3220232202eusmtrp2_;
        Thu, 19 Sep 2019 13:31:06 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-d7-5d83831b7d01
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 60.2E.04117.A13838D5; Thu, 19
        Sep 2019 14:31:06 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190919133106eusmtip2c973d9971334728740a684d22fd689bf~F2h2we2vz2776727767eusmtip2i;
        Thu, 19 Sep 2019 13:31:06 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v1 8/9] ASoC: samsung: arndale: Add missing
 OF node dereferencing
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, ckeepax@opensource.cirrus.com,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>, sbkim73@samsung.com,
        patches@opensource.cirrus.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, broonie@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <389f0e11-dd00-b373-faef-ed689037340c@samsung.com>
Date:   Thu, 19 Sep 2019 15:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRT2d7e7ezUn16l5UikZKa1IXSRcSKRA4kb/aP8kxqypN5XmlM1H
        PiBzKrrSLInpUDYp8lGhTrNMUpumqaFp6yHmI1II0wznrAg13VXyv+875/vOOR8ckiey4F5k
        ojKVVSnlCrHAid/W92f4qLdGIwuaXJbQllEzRjdXNOL03S+zAtpSYEK0oXcYp0dGmgh61VKE
        0aavH3C6YqQTox/3ThK0dakLpwte9BL0aN0KdlLINFnzBEy7fpJgTA3FAqbl/jVGV7WBmNLW
        BsRYTfvDiSinkDhWkZjOqgJDLzkljBmmUEoucXW6rwbLRQO4FjmSQB2HrsFBnhY5kSKqDoHu
        /TrOkRUEtvF6xBErgocvPwt2LOWF5RjXqEXQPjewTRYRGLrH7YPdqDjQLtbaHe6UBD6u/bLP
        5VF9PNDWdKOthoCSQsmrUjsWUqHwevmW3cCn/MBm/I1tYQ8qEpZnenBO4woDlbP8LexIRcCE
        bt6u51GekLdSj3P4ADxdrLInAspGwL3i7u2oYTCzcR3jsBvM97cSHPaBjXYDxhk0CG52TBAc
        KUMw3W9EnOoE9PSPbk4iN1dIoPF5IFc+Bc35lcRWGSgX+LToyh3hAnfadDyuLISiQhGnPgh/
        G3TbJ3jBjdkNfhkS63dF0++Ko98VR/9/rxHxG5Anm6ZOimfVUiWbEaCWJ6nTlPEBsclJJrT5
        a0Pr/cvPkG0sxowoEomdhb4ZGpkIl6erM5PMCEie2F1YFZwnEwnj5JlZrCr5oipNwarNyJvk
        iz2F2Q4zF0RUvDyVvcKyKaxqp4uRjl656IEm+p3v95rwKZky9k2ENt9HmVWdyuzzCAmUplq9
        zvlOta2FxZCKn0Sjz8KC1D9IFPV2NPiY/n5WpypjqDFRtBRbv1rtEc1Eukd4O7fkeJufSH4c
        6jiz1zFvbj77W5XtbK5v9umcPSUdpSHnSx1SOm1u6TF+7sbL4VH+hUduP0oX89UJculhnkot
        /weQg98GZwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xe7pSzc2xBofOGFhcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHuUnk1RfmlJqkJG
        fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsal+fcYCxrYK+4fW8jU
        wHiStYuRk0NCwERicttkpi5GLg4hgaWMEh9vPWLsYuQASkhJzG9RgqgRlvhzrYsNouY1o8T7
        RX/BmoUFUiS63i5nA7FFBDQlrv/9zgpSxCxwjFli0YVGdoiOW0wSZ37cZgepYhMwlOg92scI
        YvMK2Emc+NQP1s0ioCrxdcEPJhBbVCBC4vCOWVA1ghInZz5hAbE5BQIlbk9/BVbPLKAu8Wfe
        JWYIW1yi6ctKVghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0u
        zUvXS87P3cQIjOJtx35u2cHY9S74EKMAB6MSD69CeXOsEGtiWXFl7iFGCQ5mJRHeOaZNsUK8
        KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wweSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
        S1KzU1MLUotg+pg4OKUaGLfFTdr1U+BnyYHZSw58f31QYvfqmm3TJt+/IbP/VeZha7GJ7c/m
        /93y/pyqaPg9oUS1f4zy1d423P90HXpNZPKfT5gX/9rsd0FG/SSnqiLFqqN3mdo6JzWevPRB
        5rb4MeGFDLObXm83F93Gomh71aX3we72UFtpZ/UEuZb02nmVrP//flm/QVmJpTgj0VCLuag4
        EQCTUqNR+AIAAA==
X-CMS-MailID: 20190919133107eucas1p1f9502dca0c106fb9e268f2636b6ec774
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
        <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3>
        <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
        <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/19/19 14:58, Krzysztof Kozlowski wrote:
> On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> On 9/19/19 10:22, Krzysztof Kozlowski wrote:
>>> Wasn't this issue introduced in 5/9? It looks weird to fix it here...
>> It has not been introduced by 5/9, the issue was there already before
>> my patch, there was even no remove() callback where OF node references
>> could be dropped.
>
> I see. Then please put it as first patch. You should not mix bugfixes
> with features. If mixing, be sure they can be applied before the
> features.

I will see if it is worth the effort to rebase this patch. I didn't bother
with that because this sound card driver is not used in mainline (there is 
no related dts changes) and the patch is a fix for minor bug which I found
just before posting first version of the patch series.

-- 
Thanks,
Sylwester
