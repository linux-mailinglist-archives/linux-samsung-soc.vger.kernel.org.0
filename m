Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597811D48F4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 May 2020 11:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgEOJCF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 15 May 2020 05:02:05 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36045 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgEOJCE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 May 2020 05:02:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200515090159euoutp0236e9770168ac99c9a4be7030e7d363a6~PKCHbwAgw0470004700euoutp027;
        Fri, 15 May 2020 09:01:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200515090159euoutp0236e9770168ac99c9a4be7030e7d363a6~PKCHbwAgw0470004700euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589533319;
        bh=BJUvSEYuIkgkm6K5e3tQsge4+Ps1nNuHga1u75mPc8Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R0kHxm4U1Pj11tcDMI2GYr6UeyHB3eKfABhD7Ke1sAsc8XspYbBJ/uZocKL/bIBMp
         HqC28wOJa3rxmlqKO5VQulIlGMBQBJdCAZ/x6WO7azQs9EJHOEut/Ra1UcUbiLoYtn
         D4D+UY9rOF/pUaX9cCsWEZlBCMdZ45ygpNpTzgt4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200515090159eucas1p17f8b880e2c6bd05ca0885172a3ac4f41~PKCHK48mb2730627306eucas1p1H;
        Fri, 15 May 2020 09:01:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DE.A3.60679.78A5EBE5; Fri, 15
        May 2020 10:01:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45~PKCG2e7DM2266122661eucas1p1J;
        Fri, 15 May 2020 09:01:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200515090158eusmtrp266b5b5e7f8a74778bf76cc8b55b0b0dc~PKCG1o62k0348403484eusmtrp2N;
        Fri, 15 May 2020 09:01:58 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-70-5ebe5a87aa93
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8E.70.08375.68A5EBE5; Fri, 15
        May 2020 10:01:58 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200515090158eusmtip19ed78938e34f5e5f5a23a9689bc1e99d~PKCGqse3e1343513435eusmtip17;
        Fri, 15 May 2020 09:01:58 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Stephan Mueller <smueller@chronox.de>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Stefan Wahren <wahrenst@gmx.net>, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] hwrng: iproc-rng200 - Set the quality value
Date:   Fri, 15 May 2020 11:01:48 +0200
In-Reply-To: <dleftjtv0i88ji.fsf%l.stelmach@samsung.com> (Lukasz Stelmach's
        message of "Fri, 15 May 2020 00:18:41 +0200")
Message-ID: <dleftjimgx8tc3.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa2xLYRjH8/acnnO26HLWuTypS6hbEDOX8C4uQ4bji5BYIgulOBlZ222t
        bsaHuYRZMWxj1k06Nrbs1umqrOyShg5lZTaWuCypGuuYYGIrw7pTiW+/9//8n2tehpCWUTJm
        r2Yfr9UoVXIqlLQ5B91zM+MbFVHPfCI8lOOk8fWLZjGuPn2PxO6sMgL7++7S+GiJmcInfRPw
        mbe9BHa7a2lseftcjLveDIrwM3sRhS+6G0W4ONcrxsW2bITfFdRRuK/Si/B5VzWJW+5nESsj
        uJ/+HMQZux5T3Nf2dhFXb3xNcyWWJoqzNU/nLBVZFNd0qYrm6kozuGxrBeKye2oRZ7Z2kNyR
        h5li7ptl0saw+NBlu3nV3lReO2/FjtA9AzeKxMkXxuz/8fM7cQjlhRtQCAPsIvC99CMDCmWk
        bDkCl91EC49+BINfqoKRbwjMDif1L+Wm+fAIS9kyBL9zScH0HkH5pwqRATEMxUZCdfWWgGc0
        Ows6Mk1UwEOwrWL4VdhGBAIRbCy0nTwnCjDJTof3DUepQG4IexCKbi0NyBJ2CTS/KR3pNYaN
        BuuHLlrQw+FBgZcMMMGqocD9cWRQYL0M2J7ni4RBY+FmZ12QI8DXYqUFngB/6k0jcwKbAbk5
        i4XcUwhsRQOk4FkKr1r9wYVXQfejfFrwh0Hnp3Chbxjk2PIJQZbAieNSwT0Nas7cCVaRwWlf
        ORKYg2tlL4Jnq0Ng/zL5LJps/G8b43/bGIerEsOXM9vnCfIcuHa5lxB4OdTUfCaLkbgCjeP1
        OnUCr1ug4dMidUq1Tq9JiNyVpLag4S/r+t3SfwvZf+10IJZB8lGSqPMNCqlYmapLVzvQtOFK
        ntrKJ0hGapI0vHy0ZIP5tkIq2a1MP8Brk7Zr9Spe50DjGVI+TrLwSs82KZug3Mcn8nwyr/0X
        FTEhskPoenKfo7u/sa3epfKYDHH+jGNdM041O8cOre3toVBr/s4+vT6lIz16q9OQOlFdqPqq
        d3V2JMWsGyDsKWmKzfu37siLWZOYFuv10FHxq+MWdXtm/6jMu1uTusmy/uUjGTU1sepqSa9p
        pkz5ShFxWDvFWuXJurzmqTR6U8yMISf3XU7q9ijnzya0OuVfbYKCP7oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsVy+t/xu7ptUfviDCYv1rL4O+kYu8XGGetZ
        Ldb2HmWxON+5nNni17sj7BbNi9ezWXS/krHof/ya2eL8+Q3sFpseX2O1uH/vJ5PF5V1z2Cxm
        nN/HZLFg8hNWiwXb+hgtns7czGbxbvUTRoupp9eyWBw/0cnsIOzx+9ckRo9Z98+yeXy6coXJ
        Y+esu+weizftZ/PYdkDVY9OqTjaP/XPXsHtsXlLv0bdlFaNH38sNjB7rt1xl8Wg61c7q8XmT
        XABflJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
        j61zWAumiVZ8//2VuYFximAXIyeHhICJxPb1jWxdjFwcQgJLGSW+P7rJ1MXIAZSQklg5Nx2i
        Rljiz7UuqJqnjBJ/955gBalhE9CTWLs2AqRGREBT4mr7fLAaZoFdrBK3u6+xgiSEBVwkLnVP
        ZAKxhQTiJfZN+8oCYrMIqEo839vMBjKHU6BaYs4Oa5Awr4C5xIF7S9hAbFEBS4ktL+6zQ8QF
        JU7OfALWyiyQLfF19XPmCYwCs5CkZiFJzQKaygx00vpd+hBhbYllC18zQ9i2EuvWvWdZwMi6
        ilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBFbDv2c/MOxksbgw8xCnAwKvHwGkzdGyfEmlhW
        XJl7iFEFaMyjDasvMEqx5OXnpSqJ8Pqt3x0nxJuSWFmVWpQfX1Sak1p8iNEU6M2JzFKiyfnA
        tJZXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFxfhGD2ctrJ6um
        rfRnq9GtmXnT0vT+q3XKt+yW3P3vf8+rTplB2+WtzNzrt3aaqiQ9fsKrKM0Y03fQecN/K50r
        Cz3jJfiC9ic84NEPlpi4iGnd5xM5kwK2vVgkLnw85EXufaYFnVV3974Ozs7Idp2vKMXqodgx
        07NxweSvJauidytkXn+v/cFAiaU4I9FQi7moOBEAxdC18zMDAAA=
X-CMS-MailID: 20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45
X-Msg-Generator: CA
X-RootMTR: 20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45
References: <4493123.C11H8YMYNy@tauon.chronox.de>
        <dleftjtv0i88ji.fsf%l.stelmach@samsung.com>
        <CGME20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-05-15 pi=C4=85 00:18>, when Lukasz Stelmach wrote:
> It was <2020-05-14 czw 22:20>, when Stephan Mueller wrote:
>> Am Donnerstag, 14. Mai 2020, 21:07:33 CEST schrieb =C5=81ukasz Stelmach:
>>
>> Hi =C5=81ukasz,
>>
>>> The value has been estimaded by obtainig 1024 chunks of data 128 bytes
>>> (1024 bits) each from the generator and finding chunk with minimal
>>> entropy using the ent(1) tool. The value was 6.327820 bits of entropy
>>> in each 8 bits of data.
>>
>> I am not sure we should use the ent tool to define the entropy
>> level. Ent seems to use a very coarse entropy estimation.
>>
>> I would feel more comfortable when using other measures like SP800-90B
>> which even provides a tool for the analysis.
>>
>> I understand that entropy estimates, well, are estimates. But the ent
>> data is commonly not very conservative.
>>
>> [1] https://github.com/usnistgov/SP800-90B_EntropyAssessment

[...]

> Anyway. I collected 1024 files 1024 bits each once again and ran the
> following tests
>
>     for f in exynos-trng/random*; do ./ea_iid "$f" | grep ^min; done |  s=
ort | head -1
>     for f in rng200/random*; do ./ea_iid "$f" | grep ^min; done | sort | =
head -1
>
> For both RNGs I got the same
>
>     min(H_original, 8 X H_bitstring): 3.393082

Oddly enough I've got the same number for other random sources on my x86

| Source       | ea_iid -i | ea_iid -c (h') |      ent |
|--------------+-----------+----------------+----------|
| /dev/random  |  3.393082 |       0.768654 | 6.300399 |
| /dev/urandom |  3.393082 |       0.759161 | 6.348562 |
| tpm-rng      |  3.393082 |       0.735722 | 6.323990 |
| exynos-trng  |  3.393082 |       0.687825 | 6.327820 |
| rng200       |  3.393082 |       0.740376 | 6.291959 |

I suspect 1024 bits is too little for ea_iid to give a meaningfull
result. BTW ent results also seem a little oddly low for crng. Any
thoughs?

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl6+WnwACgkQsK4enJil
gBA9ZwgAl4RerBCo3cGU06Y5pP1+rqugZzPkI7o66VxgR+6drixIE3jZKAS7Q/nz
wD2F601qT6AU+zcvaIsP1+qhk/V7XXNDm8zJb1V1D3QEyVn79KNs6f8MOCTkdkG5
Nk2PWpX3VZ5y77Q5gW/TjYLTUQzyvJZ2VCMWLeQ5Hgkf+07Pt7U5Ol85T8XT/7R4
PhG2U46/w7NNRsCrOlfdkHhj+Iy/6KCsRHQ3foLvvkGURGcstkB9tSxKApE/iBPA
jZPfIwqm1Sz/TWtHUDAtaUGZhp6Nclpzfl5aZeHM/t/UIBlKn0zC9bnRzbkUC0Co
76utoUjLeopAw0FgKKqG2S0WLxSI2w==
=eb3U
-----END PGP SIGNATURE-----
--=-=-=--
