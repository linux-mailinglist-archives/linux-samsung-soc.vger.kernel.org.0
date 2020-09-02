Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4419225B237
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  2 Sep 2020 18:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgIBQ5g (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 2 Sep 2020 12:57:36 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59690 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgIBQ51 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:57:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200902165725euoutp0168478cf1d375c7d40bcd262697ece25c~xBeoInmzd2168221682euoutp01e
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2020 16:57:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200902165725euoutp0168478cf1d375c7d40bcd262697ece25c~xBeoInmzd2168221682euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599065845;
        bh=NjBtOjueZPE7WIqPORdhtfK1zhnr+7FiHhqNHLfy2pk=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=WNtpZLEbBoH9dMtM40AItlpMtNupS40LUvtKUmpfTUEisW4biowXe5c5A/9WK883z
         Z7zGA6rwY71v64jTlz7RCTDpbD0dv/xW8lhlAiCNFPpQooTNGINjUs0HlY2/so0c0R
         nYGNxdCW3KlWcfapyqJGJvicsIA6jGBNhQ8I50+4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200902165725eucas1p29b36213bd319c229948fc9d88bef5a67~xBen8PcX43028030280eucas1p2o;
        Wed,  2 Sep 2020 16:57:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B3.24.06318.5FECF4F5; Wed,  2
        Sep 2020 17:57:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200902165724eucas1p1efd279e5a23855d584eb45303f328a1c~xBenpUDsw2666226662eucas1p1C;
        Wed,  2 Sep 2020 16:57:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200902165724eusmtrp1d89f324adbe55d8e4369d1992624bd04~xBenoq3mn1598215982eusmtrp1G;
        Wed,  2 Sep 2020 16:57:24 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-bf-5f4fcef5a60c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 0D.38.06017.4FECF4F5; Wed,  2
        Sep 2020 17:57:24 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200902165723eusmtip280d8bbb20646dd9b06ba610be4cdb55b~xBemVKXsV1258012580eusmtip2h;
        Wed,  2 Sep 2020 16:57:23 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: syscon: Merge Samsung Exynos
 Sysreg bindings
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <031fb8bc-b9f5-4306-b0c7-7be2b5416fba@samsung.com>
Date:   Wed, 2 Sep 2020 18:57:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902161452.28832-1-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTURzn7N7dXa0r16n4RyNrGVGQJhrcHtpDgxGkfehT+Fp5mZKbtqmp
        EAlSPtI5kpouSxNTGVbiq3QluHxk1iRtvs1IiVKkcpql5nKeHn77vf7n/P6HQxPiGqEHHadM
        4lVKWbyEciSbOn+a9y6Yw6L2PbBRXGm7WcgVTM4QXG9vrYibWOhAXN3kgJDrbymhuKLeVgF3
        9Vm76CgtrTPkUNKxgaeUtL7iitRat/U0edbxcAwfH5fCq3yDoh1jNYPDZOJDItWo1RMZaEaQ
        ixxoYAPgVpZWlIscaTFbjUCn/YIwmUfwSd9GYGJFYNaZ/428/aqhsFGF4FezTYjJNwQ/Op9T
        9pQLGw4ZmYWk3XBlbwqgvLtm3aBYP8jv0CA7ZtggaB8tJeyYZL2hz1JB2rEbGwmNXRYBzjhD
        d/HUuu7A7ocig05kxwTrDiNTpQKMveDxbMl6V2ArRWAYvk/hriFwe7SSwNgFprsaRBhvgZ7C
        PBIPZCLIM46KMNEimOgqQzh1CMbMS2sn0WtX7IZHLb5YPgaWhgGhXQbWCYZmnXEJJ7jRpCOw
        zED2NTFOe8OyQffn6Tzg+pSNxFgKluE2pEXb9RvW1G9YTb9hNf3/DmWINCB3PlmtkPNqfyV/
        yUctU6iTlXKf8wmKOrT2h3pWuxaeoNaVcybE0kiymXnRGBYlFspS1GkKEwKakLgyx1/3RIqZ
        GFlaOq9KiFIlx/NqE/KkSYk741/+OULMymVJ/AWeT+RVf10B7eCRgfyji8eTh45wjO/ymWCi
        Wxivz6u0tmwrGFlpuBw6txg6Q6X3eb4K94kIrmDebSLnhky7Ti5Ffx/xcmZCy+4M5lh3nFIM
        ZDPypZV7FxWrtcv15rs70/yqqg9+TGuazjpgXIYUzYkAg1u/zTiVGmhQ5lvHA7lFnw/zzcb3
        IVUv30hIdazMbw+hUst+A0hsPRk/AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7pfzvnHGxyZbmwx/8g5Vov+x6+Z
        Lc6f38Bucf/rUUaLTY+vsVpc3jWHzWLG+X1MFq17j7A7cHhsWtXJ5nHn2h42j81L6j0+b5IL
        YInSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy+i7
        fpOlYB1zxe4Js5gbGF8zdTFyckgImEhc+dDH1sXIxSEksJRR4uP6k8xdjBxACSmJ+S1KEDXC
        En+udUHVvGeU+LRtNSNIQlggRqKheTILiC0iMJVJ4vgNZ4iiDkaJQ9Nvgm1gEzCU6D3aB9bA
        K2AnceT2fGYQm0VAReLS1SVgzaICcRKPe/8zQ9QISpyc+QQszilgKjFj1XR2EJtZQF3iz7xL
        zBC2uMStJ/OZIGx5ie1v5zBPYBSchaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0
        L10vOT93EyMwtrYd+7llB2PXu+BDjAIcjEo8vCe2+scLsSaWFVfmHmKU4GBWEuF1Ons6Tog3
        JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgXGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2x
        JDU7NbUgtQimj4mDU6qBkTMxSCpU4ZpY6Yyyc5ZdK64oxL47eVliX0aer/MtyQln+tfNCth4
        hutFbYFBseRX9lu/tE8cnHz+bNwskZwmm8+r8g880A3/tPLCNrYDpze2dn+POn/ki0W/hM8b
        e/3JU+RWy3dNrKqeu+BmB/ch3aT43/lNtpVzvQ7czrFuT4+eOjnv/BW5LCWW4oxEQy3mouJE
        AAvUZJ7DAgAA
X-CMS-MailID: 20200902165724eucas1p1efd279e5a23855d584eb45303f328a1c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200902161506eucas1p1f0e9d2b5bd2388c347c7a564904ecd2a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200902161506eucas1p1f0e9d2b5bd2388c347c7a564904ecd2a
References: <CGME20200902161506eucas1p1f0e9d2b5bd2388c347c7a564904ecd2a@eucas1p1.samsung.com>
        <20200902161452.28832-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02.09.2020 18:14, Krzysztof Kozlowski wrote:
> The Samsung Exynos System Registers (Sysreg) bindings are quite simple -
> just additional compatible to the syscon.  They do not have any value so
> merge them into generic MFD syscon bindings.
> 
> Suggested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
