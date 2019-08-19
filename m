Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DF594B4F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 Aug 2019 19:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfHSRJL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Aug 2019 13:09:11 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:33932 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfHSRJL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 13:09:11 -0400
Received: by mail-wm1-f50.google.com with SMTP id e8so476155wme.1;
        Mon, 19 Aug 2019 10:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g1MHFcAEeER5KLs/4Du+ela2X0EQKeCWPmFOo3YeKyo=;
        b=WVKQYTJkbyfcm8gV4j5TusRgBncMzQAFmlZrIw4HX2yz5LKoxylHKXGpO5loffeGZg
         PI0LQYEuz7D9oGzfN9+Khd52dmJaPOvaQ0FXg4jPDSO9q7y88AI3iYG2mEWRBsT81ItN
         pQ3AsKm2QV/rncKpGoS6tj+zZd9l8dygcuh4woj5W64q0iI4aPqsQSunD5u2Vbr3DzqK
         zkPjNIEie0CwdJIgmxvTw8PHanFXZAcdJvnqVYbGQDd5k5fRvgUVGDWWaFaG112EfeQA
         Nsb7l7GYdJVR4skuZ6bBxPTFgJgQmY3LfeGW9tWfNLDuE0B458mS2+PTPdVzyVmgC1SM
         hqWw==
X-Gm-Message-State: APjAAAVsUZi5PvzG7UW8PDZnP5Pad5YvyfMo8qd5KG68wWzoGAwPnmfl
        FVMdh50nSBtw1wrWd3eXe1s=
X-Google-Smtp-Source: APXvYqwjx7lb30hV3qt+dISr8DlDOdPErhTY7P/d1MD9Xm70SbdSRskPqJKpsDwrGHHDM+nWra5RzQ==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr21503482wmf.100.1566234548932;
        Mon, 19 Aug 2019 10:09:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id b3sm28668292wrm.72.2019.08.19.10.09.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 10:09:08 -0700 (PDT)
Date:   Mon, 19 Aug 2019 19:09:05 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Pankaj Dubey <pankaj.dubey@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] soc: samsung: exynos-chipid: fix memory leak
Message-ID: <20190819170905.GA14115@kozik-lap>
References: <20190816222151.11098-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190816222151.11098-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 11:21:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to product_id_to_soc_id fails there
> is a memory leak of soc_dev_attr->revision and soc_dev_attr
> on the error return path.  Fix this by adding a common error
> return path that frees there obects and use this for two
> error return paths.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 3253b7b7cd44 ("soc: samsung: Add exynos chipid driver support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 14 ++++++++++----

Thanks, applied.

Best regards,
Krzysztof

