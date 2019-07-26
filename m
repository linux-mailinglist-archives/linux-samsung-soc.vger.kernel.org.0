Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F82763AF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jul 2019 12:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfGZKkb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 26 Jul 2019 06:40:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfGZKkb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Jul 2019 06:40:31 -0400
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C79E22BEF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2019 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564137630;
        bh=rlMZw2kIjWSFQx2N6qrELfQmvs5bz98mWHdZxYeII18=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d1JqT0eqtxipes4AUqhv40yTdtEMTEUbTTc9JG+qRYudalV0vr6kWIX7fUru/vEUl
         CgwC3sv1uciSIzjdAh7bjQa/dXeChkknse8K4GsFyYbcgZDMmr6wtgU95hbbIpvniZ
         2cLGBBFtYvaS+J+DvQUoISpaRDuX5uC/nC+5iWcM=
Received: by mail-lf1-f50.google.com with SMTP id v85so36724212lfa.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2019 03:40:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVkcSSrCS8FpDcLvRfTCcGu+iEzw5U4K6cQwkkJ3avrE9GYRycW
        tgpowLW0h4Jur48zBAALV40LaZEjJrPyg+xjKto=
X-Google-Smtp-Source: APXvYqzjsH7Dck8+dURTU0a/Aa4ududDaH9IccjOo1/JFsFpeyAQjn7Bf/bgmHvrPrfOyZfZUlOzw10vo43Fu6uJCro=
X-Received: by 2002:ac2:5601:: with SMTP id v1mr3307047lfd.106.1564137628324;
 Fri, 26 Jul 2019 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com> <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com> <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 26 Jul 2019 12:40:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
Message-ID: <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
To:     Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 25 Jul 2019 at 14:37, Guillaume Gardet <Guillaume.Gardet@arm.com> wrote:
> > No, regulator is not provided. On all Exynos boards Mali uses its own dedicated
> > regulator (and sometimes additional one). It worked in your case because the
> > regulator was set as always-on but this is a workaround for lack of consumers.
> > Once there is a consumer, the regulator should not be always-on to save the
> > energy when not used.
>
> I do not have the required info here. Do you have it, or could I skip the mali-supply for now?

You can guess from regulator name :)
For the Arndale, the schematics are saying it is buck4.

Best regards,
Krzysztof
