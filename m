Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE1212548;
	Mon,  4 May 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878336; cv=none; b=eNTafGclLhq96aoAkOvqSa4YlLuxNnMMWUAq6vfzI0UYaFRZ0b3SZdjCeETPW/nPKlJazS5k0HnljfRClDBmQH7PWVAmsVZvVfogV5t29CEM8gBVzZ7U8CcpMH84yvjmAY+DzrwD9x3SixSzJlDu412hBCYR6AY8L3I6K07zVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878336; c=relaxed/simple;
	bh=yD1bWJ6KifAzP81kKtGl4zC7hoKKxOulqcqccgHpD3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXOHTFQPBCqj8898OrI/hdjU8CDqXcCao2APK36xiR+mPle5gNfxCrKngQdezDI1dcbZJB+4c9zfWQ8ZS8rRGbLGJQuWuigyAZc+QadK5t88UJ5J8e8VXOdLEKgbih4It7G8S9ZoegfP7s84XiSgey9Rhxfk3saCqr4iU3tjX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFI0PDF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFI0PDF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F3C2BCB8;
	Mon,  4 May 2026 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777878335;
	bh=yD1bWJ6KifAzP81kKtGl4zC7hoKKxOulqcqccgHpD3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFI0PDF8KzFaJPMqryKmDDY/DlVJV/obyAl3+iU6nCOd0aimqfrpxvwlDkoAJQiDy
	 WIjFVMGiHdNt4gy8qcGUOF7hsL6B9zvorQ6zyEASF1s4Cf2gNcrGxu/SY1pLeNjH+a
	 5Q4Cnpg2fmDUw/ZO4KJUlfDpVZgaQnKVxhBYy2xSQ6U6wip6SA2eHuL9dLt+d0cjn5
	 AUMp14uCf6xOdwVm+UsSlJ8jnxia9lXxYaCyGbZ2XBhrOU1vTI1zlrRvtpweRMCkVq
	 7E9f0Bdr+oX9XJ/V7/i3ARggtKmTgUzPFFxMBNR0JDLSdGpBXEY5Vp99/dJ9gAHWOk
	 w5KVLQdbMameg==
From: William Breathitt Gray <wbg@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: switch to dynamic root device
Date: Mon,  4 May 2026 16:05:14 +0900
Message-ID: <20260504070517.519372-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026050442-pleat-implant-e08b@gregkh>
References: <2026050442-pleat-implant-e08b@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=wbg@kernel.org; h=from:subject; bh=yD1bWJ6KifAzP81kKtGl4zC7hoKKxOulqcqccgHpD3U=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJk/XLkKn85VuHQp9s7ifbcf810v2mj3+NTHS2cr7ecdD c7TE0xc0FHKwiDGxSArpsjSa3727oNLqho/XszfBjOHlQlkCAMXpwBMxOgiw/9QaYEf+yPvXtmQ /XHVgR+J9s1Py56uz437tSSpLujmherfDP/zJluar/l37/RhuUr3+8qfFftP96bo7L+aahR34X3 1rv2cAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Mon, May 04, 2026 at 08:52:05AM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 04, 2026 at 03:35:17PM +0900, William Breathitt Gray wrote:
> > On Sun, May 03, 2026 at 05:50:17PM +0200, Danilo Krummrich wrote:
> > > On Sun May 3, 2026 at 7:08 AM CEST, William Breathitt Gray wrote:
> > > > Would you resend with a Fixes tag
> > >
> > > Devices should generally be allocated dynamically for various reasons (e.g. I
> > > recently had a case where adding a dynamic lock class key to struct device for
> > > debugging purposes caused warnings for all the static devices).
> > >
> > > While it clearly should be improved, I don't think this causes a bug in the ISA
> > > code -- there is no "real" leak as the device is static anyway and there's no
> > > spurious WARN() as release() is never hit, since ISA is always built-in.
> > >
> > > I'd assume this is why Johan did not add it in the first place.
> > >
> > > That said, if you mean to add a Fixes: tag anyway to indicate the technically
> > > wrong usage pattern of struct device, that seems reasonable to me.
> >
> > Okay that makes sense, this is improvement of the code rather than a
> > true bug fix, so we don't need a Fixes tag.
> >
> > Johan, I do have another request. Would you refactor the changes in
> > isa_bus_init() to avoid the nested blocks? For example:
> >
> > 	error = bus_register(&isa_bus_type);
> > 	if (error)
> > 		return error;
> >
> > 	isa_bus = root_device_register("isa");
> > 	if (IS_ERR(isa_bus)) {
> > 		bus_unregister(&isa_bus_type);
> > 		return PTR_ERR(isa_bus);
> > 	}
> >
> > 	return 0;
> >
> > I believe that makes the logic easier to understand when reading the
> > code here.
> 
> Nah, for now, it's fine, if you wish to touch this isa code in the
> future to "clean it up", that's great, but it should be done in a
> separate change.
> 
> thanks,
> 
> greg k-h

Fair enough, this version is all right with me after all in the end.

Acked-by: William Breathitt Gray <wbg@kernel.org>
