Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4584A99E3
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Sep 2019 07:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfIEFB3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 01:01:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35048 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731195AbfIEFB2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 01:01:28 -0400
Received: by mail-pl1-f193.google.com with SMTP id gn20so696573plb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Sep 2019 22:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SUBeohh+HfbbNLC2vNWJGf1wy1Gdj58+BXfyMUrKjoc=;
        b=lQNQsZxYsESZuNfE0/YmQ6QEjfkBMP2b5Cq9hW5SSuH4ZmInwZ+bEdgwHTQBKexs0l
         mm0PIiuvSihKeJKrtU55xFyIXXKbfpkaUUHA6LciwO+kh3SqCIR9dRisUpjIKrdmLCH/
         aEU5hKRqdQraaaOa2/U1+8xQssGgrCYcV84OknuhvYOam+Zusks1aoH2zBwhNfOdrPqw
         WPpvMOU8e5zTBL/stzc3L/IDjgE+sj3e8ePSTkncNQklhRJacblNFNi5XBs2m3VZpkLp
         PzcLlF6mvd+UN7b3K2oVTrAaCu+B9Jc1ZCiBw1+rbT9eITC/YqJtkEA2jAMHxi6euTGE
         tnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SUBeohh+HfbbNLC2vNWJGf1wy1Gdj58+BXfyMUrKjoc=;
        b=qmY1aCTauUAPHPK3RKy93sbl5mv/i4c+FRq5gPCQwsLC0G332tDa5+GzKV+iqcMKKT
         sizN7AJD1jFXTbaWTOct9FxOKkapvFjrra9xFlYF31qaJy6TePFgDmloBuSPx/RalSaM
         zq5z4naRSNwHVBJclonExC6K2shaW5U4Fcm8+WZcVaG/ZsFEqTc0MPfO7W3gLGv8ipLg
         rE83xjMQMIx4bTq7NCVn01i3TFhmpEDw3cSeZEnQSskVsjz/gGl9MJDSEdy4u5YA08Vc
         fdXYrgDpYs+hC5IX8qcmcGFUhSaTt5Ii2VHbC/MqdjSv+NYfFmUJSiNTUQcGeCGVlf2u
         4O1w==
X-Gm-Message-State: APjAAAXvaEY004Eyc7ka4z7IKGvaXR8H1z543oKW9HGxGhoW1+FmxF/p
        AMnTJ2xdUFj1dvlMq2twhIf4Ww==
X-Google-Smtp-Source: APXvYqxLKp/hQTBJFZg4bq2XsgfOo5v+1kCisfZEZTN8ZhsozLd3tLyYaMrWDgM/E+T8p4eXRva++Q==
X-Received: by 2002:a17:902:a58c:: with SMTP id az12mr1410313plb.129.1567659688106;
        Wed, 04 Sep 2019 22:01:28 -0700 (PDT)
Received: from localhost ([122.167.132.221])
        by smtp.gmail.com with ESMTPSA id p189sm1181543pfp.163.2019.09.04.22.01.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 22:01:26 -0700 (PDT)
Date:   Thu, 5 Sep 2019 10:31:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org,
        robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org,
        kgene@kernel.org, pankaj.dubey@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Message-ID: <20190905050124.kopzxxouuuta37n6@vireshk-i7>
References: <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
 <20190819090928.pke6cov52n4exlbp@vireshk-i7>
 <b831d7c5-c830-fd65-20cf-02e209889c28@samsung.com>
 <20190819112533.bvfyinw7fsebkufr@vireshk-i7>
 <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
 <20190820030114.6flnn2omeys3lih3@vireshk-i7>
 <06ccff05-2152-4bcc-7537-8f24da75f163@samsung.com>
 <CGME20190820092123epcas2p2170ae19467a5fb19fcfc1acdbecf9381@epcas2p2.samsung.com>
 <20190820092113.gojhe3romdnvm7eu@vireshk-i7>
 <4e6379a7-0d4b-8e0d-c225-49976b2587e0@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e6379a7-0d4b-8e0d-c225-49976b2587e0@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04-09-19, 14:37, Sylwester Nawrocki wrote:
> I have changed the code to use dev_pm_opp_adjust_voltage(). I was wondering 
> though, what did you mean by "triplet" when commenting on this patch
> https://patchwork.kernel.org/patch/11092245 ?

The voltage value in the OPP core is stored as a triplet,
min/max/target kind of stuff. You can check DT binding for OPPs and
see the details. That's called as triplet.

-- 
viresh
