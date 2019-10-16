Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0079ED8FD4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Oct 2019 13:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbfJPLob (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 07:44:31 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34462 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbfJPLob (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 07:44:31 -0400
Received: by mail-il1-f195.google.com with SMTP id c12so2258582ilm.1;
        Wed, 16 Oct 2019 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9rzJpZ/HcxH5TEm+aJfkTf0wd0cfT+dxcCtHXvrqpcY=;
        b=PDFFMc4s/lwX18Vk+hPzEDGpDQ3h47O+UWMuWS49bHhoyM6mM/fjxovdm6PCjkKAnG
         MVZMfm2/x4nbcaTqPzyni6bO2SNJeI1cIVUc70BFj36w6pZY69qvlqL7wKyj091nCNkp
         /Ec00BI9wZmhz6tbD2yV2+4Ajpsb81v7Ef+i/0HpGX2q93r9h5FIqA+df8fEyaLExcJA
         tmOZaBqhvrQ8HQSs4YaYm9QgOU4/dMg1G/pB+ue8CmddgqcjZKZak+EZg1iA8+mOQKnZ
         4LUQtq0Vd8vt4fzVdfpJioxlu9N/Mx+DndRyYTzAUpc8Yi41inEdvAuvmt5TF5QJjjKD
         WAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9rzJpZ/HcxH5TEm+aJfkTf0wd0cfT+dxcCtHXvrqpcY=;
        b=c+g5jF8GR4d+u/1JhzgKJ4t1KZ5tSaN93uDOVKWbQnlWNcvSkiDWoYiwIAHZhx5CZv
         DekC9R7eYDYhE5ckhDWGQ1lNtV3oZo5u+ASBCcXJIO4mpec7HY+Eq2UvCu52f2K0wi96
         qxTcCsBDJ0IBq6LON80lGcbo5Id8C5yShU4IDXDt6YdOE5+Uoi0ocay4Rq30AxPvxcgx
         9enyNWp8ja2gMMygrTRFTrfcQ9tp3LDmplE7lKD4GTu7jc9rx3JeJecTGfQWfHuGimDc
         n++CLwcSx63Hx1Aunlv9LOQm3nvnR8kRmV13MIgNNWG2X9/o1ylssdC0H5IRYC5K7U/v
         oVhQ==
X-Gm-Message-State: APjAAAW5Dlb5v3wLdasCmRa45oiN/B6LldjRooPIXmUmofqz0qF1KZR7
        i9JMHIvpmvIL1lk5yBHCk5v2XLaNMpQ+rLUEcPI=
X-Google-Smtp-Source: APXvYqyxv7TzerJeMw6nTSB+UeqDuw41lCw0ERreleWN40C0AUydIYPur8vywHaxYsreWEALTqx1BPxv9Rd1EjwEScI=
X-Received: by 2002:a92:6701:: with SMTP id b1mr5510418ilc.181.1571226269872;
 Wed, 16 Oct 2019 04:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de> <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
 <285fab33-0513-8a6b-f30d-f602c4e5108e@web.de>
In-Reply-To: <285fab33-0513-8a6b-f30d-f602c4e5108e@web.de>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 16 Oct 2019 20:44:18 +0900
Message-ID: <CA+Ln22Ft47yJx5hO0YNOobJDGtg7t0_DPdeBif3LmMcn8gyykw@mail.gmail.com>
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "moderated list:SAMSUNG SOC CLOCK DRIVERS" 
        <linux-samsung-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

2019=E5=B9=B410=E6=9C=8816=E6=97=A5(=E6=B0=B4) 19:55 Markus Elfring <Markus=
.Elfring@web.de>:
>
> >> * Is there a need to adjust the error handling here?
> >
> > No, there isn't much that can be done if we fail the allocation at
> > such an early stage.
>
> Can it matter to perform the setting =E2=80=9Cpll->rate_count=E2=80=9D on=
ly according
> to a null pointer check for the variable =E2=80=9Cpll->rate_table=E2=80=
=9D
> because of the function call =E2=80=9Ckmemdup=E2=80=9D?

It would be a good practice indeed, but looking from the code,
pll->rate_table is checked elsewhere, not pll->rate_count.

Best regards,
Tomasz
