Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D081F69709C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Feb 2023 23:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjBNWSP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Feb 2023 17:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbjBNWSK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 17:18:10 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A239D21A36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 14:18:00 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id jg8so43680508ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 14:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNrKKIEifKOtj0ZTyaBn9IXYDH+TgIsaibPuySrCl9A=;
        b=NXJWQlVXdExWigaYiVmHP67AJwtobiv0bNA7KQ3Il7g6RaNU8h/JRHfIO3wtRXw4+Y
         PXUAYh4QdqzK2SUbG9/cLaxJ7/GMHZn91ubYjHynTfO/HLgaxPRpfpvXy9Bmcr6xtCPE
         cgOMNGJen6ll4d2MJWsbkOmHYGCP7YmZMq7N1D/q5PuloGWNlFGirKYx78ND7wDqkLIU
         eKqZDmPgby8bGsTcdT3SWS4mgyW4VbpYnQhQ9nMpa0BkvaiZz3hJSx8x3CXjYuUbMxc3
         HRmhWLylScjQodShvpA+xQjiAMjrmgGM0jH/Mx1KhMtPqz4eajOhSb8hyw9Gdn03OwCU
         ufWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNrKKIEifKOtj0ZTyaBn9IXYDH+TgIsaibPuySrCl9A=;
        b=xlf1qC0Za+r0wLMVUrBqbKOaaphG051RlYrvhRvzXdgPKHtlPPHdAnYQjGfLpXrtee
         dQSJhzIYfUC2CeiWVqSjpV3Sb166CJ25OkPfoL8wPNtLNfoxpjUzLO77IUcHALCWHrZk
         asBf/Rg1a0PEQ6sSSTRGEQhJLu2LfZJwXcchjOuueFI5XCW9C0ffKcPyZD/fhd5cWvgs
         HeHg0u2O0Rogmwg6r+LYLuO0QvWSRRwFZ2GgJWGTMU8ZzwTLQmIIl8D7xP63TNIoUhVG
         NDSDKijb7MxIGbvHtt8OO7Hwk1sGUoOM9ve5LOvGzxlBB5e7ON2MvUt8oW5FwVEBPtIK
         8R3Q==
X-Gm-Message-State: AO0yUKXDkj5l92BqeS0VYPcuANO/TubKZN3Sn67yQBtUKPp1WVea5ygP
        yRTLK2UGninuyvJTPuiA+3Dr9x2Eoh0XucNffnY=
X-Google-Smtp-Source: AK7set+QEu8eiJsyukUuGBuGdN9zcxcewEe6LC4u/BLo8BbI5vnU+nA6liH5QBGNw9h0R3QU0+C7QBqtx8QqSrU52pI=
X-Received: by 2002:a17:907:11dd:b0:8af:3e28:acc with SMTP id
 va29-20020a17090711dd00b008af3e280accmr30378ejb.1.1676413078769; Tue, 14 Feb
 2023 14:17:58 -0800 (PST)
MIME-Version: 1.0
Sender: beatricecarlin64@gmail.com
Received: by 2002:a17:907:c686:b0:85d:6a6e:66e5 with HTTP; Tue, 14 Feb 2023
 14:17:58 -0800 (PST)
From:   Daryna Olga <olgadaryna957@gmail.com>
Date:   Tue, 14 Feb 2023 14:17:58 -0800
X-Google-Sender-Auth: F7_j6BBFvH0UWQEuObdRpCy0uXo
Message-ID: <CA+qmXqcM4KmpVD45eLVmJykDGPvEmoFEtX+kJKpQiPOhBGbnmQ@mail.gmail.com>
Subject: Daryna Olga from Ukraine
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:636 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5032]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [beatricecarlin64[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [beatricecarlin64[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello, My name is Ms. Daryna Olga from Ukraine.


I have 100 Kilogrammes of Gold Bars. I plan to negotiate with you, so
that the Gold Bars will be delivered to you in your country and sell
it on my behalf and invest with the Funds in your country because I
want to relocate my late Father's business due to the ongoing war in
my country Ukraine and visit your country.


Thank you as I wait to hear from you soon so I can tell you more
details. God bless you for your care. Contact me through my Private
Email Address: DarynaOlga@gmx.com

Best Regards
Daryna Olga from Ukraine.
