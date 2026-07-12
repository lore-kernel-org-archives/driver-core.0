Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0022083
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 00:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783815840; cv=none; b=jB6tU84xYtHMY507Qi9aUSIQvw+TdA/lVjSh+GoLKTnbJHJ0g2uTmW8iAUSGrvoDQ70mFBRKq7JfVLZODpKg6e/xXHjrCAeoS0RLYkzRwkSGB39Un5zWr0o5q29f9f5WW+LRCwuBup61bK0QyiRkiR70q1qWcY24DCXbk7l4liM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783815840; c=relaxed/simple;
	bh=bAEX6IrgDDFkv2APR0+bCQv7uhaJbAiYg7bB5M6IjJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC2E50+0Li2fPenre+AgcIHUMyyT8OONCqrzrZSMmn7nVnJj8iQzRQHeu8NWcbo0l7KNGi2EWosBMsANgSS3OcTxYPKkFp6iTtpAOdq3KLJVNBxqoLuNDgf3SNzMtqCUOBIgy4ahwWmnMKQ91rBoT4HEKEDjoUYP3i9FGP2jdKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX9FLzMn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NX9FLzMn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so1330471a12.3
        for <driver-core@lists.linux.dev>; Sat, 11 Jul 2026 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783815839; x=1784420639; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ix8TBK7GOyTp1WMmZekQKMguwcNzpi3wCbkHSbHtB4=;
        b=NX9FLzMnzIFp9wJryu0P1bC/Npt16+7hmzME2NmEDWjnQFE3+B2Eu1T2zTo/xtKn+7
         b8P89dUqnV0hJAzDIrlKoDkN6TKpEaxZ5l+xHY9uUGGNDCdP9cqsV5gid32goa9a3z3z
         G5S2Amq54ZG89vvp3pgzGfae9SiC641y+C2433/TReDHaBnMS2NhnT7hFhcQAC2Co+fT
         VYJFli36XPN3iYuYNT9OGrJnlmTN6tufHVbdTnxJv5OHxLzOfIQeJUQ4iZHATqFgWMSZ
         CPDgWj1D0Jsp8IWw4DMpEClSezzpTGrp9Ui2bPGtkqRNBQGRO4aiZGeOJTmhihvwo8ak
         HSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783815839; x=1784420639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ix8TBK7GOyTp1WMmZekQKMguwcNzpi3wCbkHSbHtB4=;
        b=Pz0rIjKDjSpGP26kYqrF44VlckvFNby9yU6JMfz+PbmfC9D20B6WJz8ZD301uBBzh2
         4Jk4Ookk46FZo/icNT1xN9D77X2cafUTsmgORdUr1zjndgQyg+/MBXqfB/lKTDl3O8d1
         UgmmRVSUVAqQh7KeQ5eGGlScyStfh++lUeswJpVCsyJ5ivpv+jpUakjyjWYMvXf1kBa8
         NK8r0ScHHeImCy473QwXpEFYrzSVYdUoO6aKmrcia/jveDm14KLUe42dN8wUG+ZAyraa
         jzJAaiKWlgpGLrbKPx1UbgOU7Qw57EbXYOZW348eSWCCJ6qoSi8QGyifYzs1Tfwn1X8W
         JsQA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7WmdlJKtyiTBWidm1Q0GG8gh4CXyT2I8CLEISPZ5NOyHydXVFc9KQDWsvOdwUMMIKHvUuKpwFq/rvcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+QdMdkEhoWIXr95ON+SRdgnIRE3f+55JIJGoNhye+JxRF9yOR
	b8meN8Lzk3P+Nnd8MjTyHe7cYRxFrmSuCZTDcnNW/u1aAZTCjAOaBV2f
X-Gm-Gg: AfdE7cmcuXyb6LXVx0KV/a3Yhn0CWOu7unlyDNerQeUVJoxNW5lwp3enXsgKDp2wzTz
	T2140r1329evntUL2X2NxLeZnG9fYqhKnrI4cbRs4tHnQBe0XrCragy50ObaJQ1CQfrl/Ug5CAL
	JwwIcZT/6+/nel4bTlZEbuFsK77axY2+2a2B1QfWMtcEvtlt0V5lARqu7KFuOSdhmI0/Dh4qDE6
	i6F+XvB2LZQ4l4DQL+e1du43zW2eP7x48Ba2ZrJLtbXJYVvNxsV0KjXz3IMGF/MOzTxLykPsqnY
	unARJpwubMgArWZYemxeKud6pfy799mQzH5sSN9fGYiqn5nZIa3zVXkNeveFVYX5phZ78QVrSCv
	ZLHKKWxernwz2Lf8OMV5SFp/Cwwn1ceSxl1S8O2m1cPTA1lJbMwiY7nDD9ckODb+ZUdbhiBKYoA
	1PlzmKru4NTc35q9zrj8nRgPF0ubrqJjbw3heqQHVEGTQbYNrG/TrK+Ww7mz8OIwc=
X-Received: by 2002:a05:6a21:4d8f:b0:3c0:9c1a:894f with SMTP id adf61e73a8af0-3c110b33403mr4710043637.71.1783815839033;
        Sat, 11 Jul 2026 17:23:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm59615501c88.11.2026.07.11.17.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 17:23:58 -0700 (PDT)
Date: Sat, 11 Jul 2026 17:23:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware_loader: builtin: fail build on empty
 firmware
Message-ID: <alLee0s4gtCM7dVj@google.com>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
 <20260426043041.649202-2-dmitry.torokhov@gmail.com>
 <DJW5EBHLCXO4.PFQOK4M2ZZ48@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJW5EBHLCXO4.PFQOK4M2ZZ48@kernel.org>

On Sun, Jul 12, 2026 at 01:58:26AM +0200, Danilo Krummrich wrote:
> On Sun Apr 26, 2026 at 6:30 AM CEST, Dmitry Torokhov wrote:
> > +	if [ ! -s "$(fwdir)/$(FWNAME)" ]; then				 \
> > +		echo "error: empty firmware: $(fwdir)/$(FWNAME)" >&2	;\
> > +		exit							;\
> 
> Shouldn't this be 'exit 1' to actually fail the build?

Yes, you are absolutely right. Do you want me to resend or you can fix
it up on your end?

Thanks.

-- 
Dmitry
