Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D9BA21AE
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Aug 2019 19:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfH2RDM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 29 Aug 2019 13:03:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33026 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfH2RDM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 13:03:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so1923872pgn.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2019 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cT40aX1Rm158dXbZvg7FygLmkaJhPhVyHtqBmt7878E=;
        b=PAXO8ZbCVqCw0eVBICcj0380noufm8aJLcc22R6FQyST4NWgBmi93l2YHrrW8mL0Bi
         oytzULxOstEziMDvAjIC/na6bXjIH2Gbhn+UtLkEiHbSzC5zuigdjKWDl5IkU9KNaTHk
         vNXzdah4WS39Vp4NQH4N7miEiBLnAxdMrpmLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cT40aX1Rm158dXbZvg7FygLmkaJhPhVyHtqBmt7878E=;
        b=aJjpxjIdNS1JJoV9k262oUVTXz1IpuwRRuv59ybKcbPjSvTR1F0bRS/LBEyDxu+2s1
         vjwdpfTKO3R3Zy+xuBftXp5HzOXuMP8c7FTM0qj/l5wwYJ/SL1AuMeU97IIoedRCSXwa
         oYKwiLmIDed4ZMZA5/2XjQkf8agAWH/SF9kSs95XB58yq2MxA+YwBD30KLabqgT23yWx
         t1gZ8MbU4SXJC+LIT9QSOdbJlcyTMlgqksotIyECrBXXBaD+5UmNQVVrA8UrAubPSA6/
         n1igyc6lKlukC2C7xoqZo1LWkmEL8GacDNj8HUuLmrM8aVtokZ769KQ6d+f5O4vOWDlp
         NWQQ==
X-Gm-Message-State: APjAAAW7fb10AYyRjhrmw5CwTdeyekeX8+jvtv89smttuqQ4YzfEgak4
        whnuOqbNeOoLAMHVks5qX6Rz3A==
X-Google-Smtp-Source: APXvYqx/Q0fFZvZWabn6tcL2I8GORQH9uYo7dBQccjsc+OV6Z3702ta4szivlvQBDGAk0mtwjAaNUQ==
X-Received: by 2002:a62:1a45:: with SMTP id a66mr13125850pfa.142.1567098191599;
        Thu, 29 Aug 2019 10:03:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t9sm2671099pgj.89.2019.08.29.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:03:10 -0700 (PDT)
Date:   Thu, 29 Aug 2019 10:03:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Antti Palosaari <crope@iki.fi>, Mike Isely <isely@pobox.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
Message-ID: <201908291002.2F67F5ADA@keescook>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Aug 22, 2019 at 04:39:33PM -0300, Mauro Carvalho Chehab wrote:
> Doing something like:
> 
> 	i32 foo = 1, bar;
> 
> 	bar = foo << 31;
> 
> has an undefined behavior in C, as warned by cppcheck, as we're
> shifting a signed integer.
> 
> Instead, force the numbers to be unsigned, in order to solve this
> issue.

I also recommend using the BIT() macro, which does the ULing correctly,
etc.

i.e. instead of:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? 1UL << 31 : 0;

use:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? BIT(31) : 0;

-- 
Kees Cook
