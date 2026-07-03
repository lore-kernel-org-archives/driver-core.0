Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF57315D3E;
	Fri,  3 Jul 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113567; cv=none; b=nZH2yx7eOxS35oEqGG7lyoKjqnVYPVv4EZUMlRtqEX0VrH6+5kDB5mwV7aKQf+YTGpGtAFZsUCJ/o9tbnEcokSjd4Zz8AggOFCK9Jr7Mfq4/rC0DwlhF244rwRU8St2gk7UXaEEaKRN3nlDpibtCWwH5ngE3tlbG9UGfXDFFRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113567; c=relaxed/simple;
	bh=HSVyQgTNRKjiO3y0EKbdhhDTHl5wMmcABdttepBlw0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWxy06J2vW9VzMtkxtbFM/Yg3LqEgDdfoYejcboRqfQ80hEZlpaV7pZ5LP476eFe9ZV7Wkvv+cpqxjJreWQ1oEs/4qgEwOUZnRbBPmnXIU+68/4BqQe2AgMdVNO+zVV0qY+xvuvyUfbPxepo8IczMDZ/36TjG/Lt/fJVw53fVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK3p7BBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK3p7BBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034441F000E9;
	Fri,  3 Jul 2026 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783113565;
	bh=FJmeySm56FWkDjIm6myUof2VPUlR63a/GY14WN38RUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DK3p7BBF3cbUygbDBeZv1QTOpRLuDuAkD8zJ0whFmNl2Dxzs6U3lbdbFNAkd3f/W7
	 R4l3Jxv1vOrVSY6dA4C13FX3LA08eCAuenfP0roKK4od2PPEvjdSyU1+ZFwHafGbXh
	 LLlN/wGB+tJgB+liOj+gvr9jW3Ui5lraCSfnHztIGlnZGuU/461Ru/rtNX2aaGkP9e
	 RsPShWOxGxHOmvZyLeoTZTGwqIjJ6zjxYyW57kvbvjw4OrmSvwCsl5S1eZWUAEZdGN
	 Iq7CdhF4N5O7RBRyao7XemSKCT4y6uxVsE3ewapcEl22GpQr8qdk6KO/4iAhy/ZBal
	 HhgeevMaa+kxA==
From: Danilo Krummrich <dakr@kernel.org>
To: Syed Nayyar Waris <syednwaris@gmail.com>
Cc: wbg@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] isa: refactor code to remove nested blocks
Date: Fri,  3 Jul 2026 23:19:22 +0200
Message-ID: <20260703211922.1153778-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701205857.GA4113@syednwaris>
References: <20260701205857.GA4113@syednwaris>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 2 Jul 2026 02:28:57 +0530, Syed Nayyar Waris wrote:
> [PATCH v2] isa: refactor code to remove nested blocks

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] isa: refactor code to remove nested blocks
      commit: 0fa8e47dea17

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
