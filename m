Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6299D7E33
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 15 Oct 2019 19:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388720AbfJORzg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 15 Oct 2019 13:55:36 -0400
Received: from mout.web.de ([212.227.15.3]:53611 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbfJORzg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 13:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1571162120;
        bh=TZIhK7EPJZ3JVj0kpDPDNCPLGn4fJ8OQ0rsR71wX43g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=hI6lxSmPIxnpA6blTd480mKzLlB/K291z3ephuzZuGr0VTUbBZ+0X5dAgKa0B2IwT
         5BsQKaxbjU5Dy8Dl1N/U+Izh3LHkhU3Q285EHWnLOrATScmoozAdOPPBfOGzA3u7YD
         RnHe1+RtTXc+M/qDtrXPg16JII51axtUvl8kV6Bk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.79.11]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LeLmv-1hiOo90Uof-00qCu9; Tue, 15
 Oct 2019 19:55:20 +0200
Subject: Re: clk: samsung: Checking a kmemdup() call in
 _samsung_clk_register_pll()
To:     Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        LKML <linux-kernel@vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de>
 <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cd91c7eb-7f14-e029-e495-6591987acf7c@web.de>
Date:   Tue, 15 Oct 2019 19:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:pfL5YAYOo318bQiYtJDsdSxRQG5+68eucllEE5BWY8dlgfabVZU
 1Oj8vNZ8j7NFeOIuKaEqSoOFFF4ild9AVRr6lhsrfqDkYQJuYhwbcrTHtQivXHEFb+NLm9i
 stuzHuczl4hzAyPoDuG0UgZmpGfiNUlWfJiM1bPmmfxVs8c0pTIatdUpeliv+kxpN0JluMc
 cLqw2UcTS2B81WVOiZEtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9RU17UZTM30=:gig+41eh2DY5MgY4/P4y1w
 Qkbv8fW7vpEhkuBqihtISRILuA4t5D4ZN8icHGY9f9opGMjXUPw/IJWB4pdLdIns65YvJw2U0
 sRcIu37/ROjKGIJJpOxXIiXfyHDf/S7YbK/aXmQzloDcQfgIkyGBsAexVIsESWw50PKyUGXGB
 nZef5+Gh8323ilsj5uLu8amcx+XzI+HBQS4Ta98MFJY8kJVNkTOkDMuTFU966ZkieyoMv7swU
 gh3T8wvGH5gcd3F5nml7m0m9ckn4/fmqjrBNytji8PNwANb/m75bzetE/7O/+jxK3G1h/DOa1
 PXMZG5loZtYCb21qI9ZeB7KansPoPTDWUfDb0aMOQVQcCPOWGD0SntNpfy6SJyEZBYLXKaLXm
 Dg3vVXQ3ssIZS0cfBNutD9F25Slik3zZlKXewVSceL7o3RZDp9zFaqgKOMCfqGyFS42g2IuVE
 yLy4//fxba1ah/Vqd5SNd1khsm9mP8GNHzH4hQ5DQLg295qUS1tgCrrNiOfvjl/uznloEvybn
 fTV8IjNv8z3yKGEhq50uq7uWvaWvCWHZR8s/EiGRinQOP3COdDwDZ2rpKJeZgE1QCs7WQV0T2
 GYy57FKooCAaEUiAvUfeWBl3Y4eClXYU/3X6ykDAXI49dyThtguBAVNiGjREZMLuG1MFRM9zz
 /MIRP++8sJZPwsKuK2ueVEdqksWeX4mnURWYJmq1uXYKLDGfiW8mEXjVTqumoGes4xFxAx+63
 MNNAfeE8xmTHeZoPzGNW80cjsMXQghedCcFLBEcd/xq2T01mKa3XVDtwRiDlRdOm43SXawt75
 zHtFsnDTVQqpxupMWn+0CAzBb57sxn56ULgPwOwZPcb1VNGfRJjficAsh0syMNYRdgthBXtjT
 6tTV5RCJ23c7jrVigvSukAPYo8iHo+0oWUjDApyZQjAcW7kJqBNXZhNQFPekND8KrJN4AyHFZ
 A1f4u0QJWSFsiW/J4nkekUiE9F46GHhD+AvE4V2zdfuAliuG1lgO3PURYL6P2SV3q/VgdCQEH
 3CyT96143Fqqk5oSGxMMmN5Fribz1BQqI+iZnZdAVd6sdeWe/5lWITZbEhQBtbI4+bSJPgjEm
 cdETkv11MojL2LWHHoiGw+7UMk7KjyQnh9U3YZg5VrWdL5TNiR97PoTH/xnqn90Ei2uyszLMu
 8HW7t8KNNFyfV8VbpbzzvAnbluKVw+NCZ8rduY5T1gVpOGHrCGEtcaFEwQOufRzYmX8X69oLb
 jX//qSo8+2LiPqtM6NqdHJl9vH5OloYz0B6Vdatu4cZDVfDnwmaZLpY28DC0=
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> That said, there is no need to print any warnings or error messages on
> allocation failure, so technically they could be removed.

Do you find information sufficient from the Linux allocation failure report?

Regards,
Markus
