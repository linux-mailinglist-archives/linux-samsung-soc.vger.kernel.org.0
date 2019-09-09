Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9A2ADF2F
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 20:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732580AbfIIS6s (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 14:58:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47102 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732524AbfIIS6s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 14:58:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id d17so2540193wrq.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Sep 2019 11:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HvRkt0TzAfkK7uPLWRNpRW+QhrAhQM2j0J6Hs+s2IqQ=;
        b=Da+rhSMIBaZTQqJROWIlc7IQRGZdgPSnI/fQu4mHhTUdIMSeRK7NVe2y3wboWataNq
         +GCdTxhsaQVafE6i5oMqAbH2uE+d5zgU8DK7toBfq+YXDA6oa8fl4zEKaNogmcq47///
         l7/n0/YneI+HZ3bC84CLxkVocGQN9vNn993f/VA1NVYmI11trv17aPmyE4f1nDw/726H
         lccW175Dwen1++0JZ+BOgc/VpMHVmCvjxy9+patxzhMH/sAroqPS2v53StHuisQjhLCD
         2bbdmw7N6+FS4e9uvVnLWLFrtduj0uorxMtRr0mf052Ik69Ot7/LbjxEFG5tzxbjuN4N
         Xw5A==
X-Gm-Message-State: APjAAAWPwLcqloT2WJCNryT0/F6EnCSXumZf2JkwBdIqOzIbwutOv9c8
        Lhi9hBcSnOrzp7lQ3aqJB9E=
X-Google-Smtp-Source: APXvYqwa68d3w6+uCbFgeBtFQ3I/GwNC/dJsnkNxuF+q83HERWydVFzqpE5yRap3QjCQZZ+0WGpi5g==
X-Received: by 2002:adf:f601:: with SMTP id t1mr20434150wrp.36.1568055526267;
        Mon, 09 Sep 2019 11:58:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id 189sm705109wma.6.2019.09.09.11.58.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 11:58:45 -0700 (PDT)
Date:   Mon, 9 Sep 2019 20:58:43 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: exynos: Enable support for ARM architected
 timers
Message-ID: <20190909185843.GA9827@kozik-lap>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2@eucas1p2.samsung.com>
 <20190828121005.29368-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190828121005.29368-3-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 02:10:05PM +0200, Marek Szyprowski wrote:
> ARM architected timer can be used together with Exynos MultiCore Timer
> driver, so enable support for it. Support for ARM architected timers is
> essential for enabling proper KVM support.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +

Thanks, applied this one only from the set (I will have send another soc
pull request before merge window).

Best regards,
Krzysztof

