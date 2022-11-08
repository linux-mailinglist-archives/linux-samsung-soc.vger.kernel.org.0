Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D84D621674
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  8 Nov 2022 15:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbiKHO1d (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Nov 2022 09:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbiKHO0y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 09:26:54 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9A124F1C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 06:25:45 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so18042553pjk.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2022 06:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=frTjEIHTlXO6v5jJNflbe46il1dUjxah1hmkPCKJYy1/f6aaVZ96YwVNT21c8Mx+VL
         R0PVu5F+awlay7dv8uEqG3mfQMZaN+xEIbVs3zUJk90rHuBTfTbUKI9ehW1dX10rlbxd
         mQXXSvWli42inJrLM2g6PhN5xYN7/tmPsk29sFPQYGlAj5/CDrj8p18q2KOhwzU0yn1Z
         U66f4vHTq4ebadAs2QjhqyxxvIbo8plXAHwfVczpBCyZj8AfWtsEsZzbPdDqwFqP6y9l
         dnCncy0D5q5jmwTVNrSaXkMoaoWTcIIADYOaYowOD+gdgXtrIbBhvp2gXI2k+n6CIgmW
         oJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=0D1aoVJ9vu/LHwCqKhrVKQIIjEVzNpiZ17kBUVMLT8gkZD0z6cfKo1GMWhAEDzIwzH
         Uee+sKKmFrZwwMwsd7BBDCl8d4/scTsep+LHRwWvHzTuBgvon+JSBQKRmpsxwpHl3NwV
         Mw/Hlg2GmvKIa5r374lqRSodO62xbh/3r9k8KfD+niviw0yYrgpK1FDIw8k2zxNIcZke
         9eiquHYxel3s1zDoDBUcB6XBp/j0rhbUWI/rIX1oQcKcbbt4leVZbT8ZJ5oEkkklNF8S
         vzs5neQQdOOOk3/4nQxekj57c33l3ykFtiHmTg8JNkmGeaJoqAk3yYdjjH6sSq2R6njP
         rkIw==
X-Gm-Message-State: ACrzQf1Qja5Wt7C4Llh3iSnua4JplvfzDlNy4Bef/Bvt7oDoTHPFPhJA
        Jl2PQWrpsLJwBmHHG7uyir7DPmi+aBFyYpC4nTA=
X-Google-Smtp-Source: AMsMyM7i+ouk6KB7gDQcijSLT+5BFPLxz5mMKwdHu69kXLREkeFp6kif+v8n3IHurpTlIb3CZV20pcw+4UqMuGNpObo=
X-Received: by 2002:a17:902:b581:b0:186:fb90:1151 with SMTP id
 a1-20020a170902b58100b00186fb901151mr56255957pls.43.1667917544943; Tue, 08
 Nov 2022 06:25:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:5388:b0:85:81c6:896c with HTTP; Tue, 8 Nov 2022
 06:25:44 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli11@gmail.com>
Date:   Tue, 8 Nov 2022 14:25:44 +0000
Message-ID: <CAPBO+FLJ4NDKP9BsZOPRz6jaWhgZgOACSy5HwxhJ-yxSoaUS2A@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1035 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4917]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli11[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
