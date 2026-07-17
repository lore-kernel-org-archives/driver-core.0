Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC4175A69;
	Fri, 17 Jul 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331087; cv=none; b=cH6r4XNojLdwulVNitd/Ct8mj4QMgRIHmXe3gCN7vikwfnzyDEUak3CDUHXS/Q74xpuxd1aujWZC2l6K9Sr7OdKjdRJ9EHByi3ed78lJOczKW9xKhIHGQlxFmUTz5/S9+inNXFF6UKSDPjG8nfjxj9lTJTG8GW6j8qkWVDOPooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331087; c=relaxed/simple;
	bh=f43o6QDMi8JdKoxk2jiw+ZcKq3etwCDjvFA2e8kFOXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cbF8rbV6LaImAehr6lyrLqJa29Q6EqJqq74uLi06IwkN3Zwi48RmAElflBYBT14EWA7ROG4b9lnFd4jwF57jWFsMF3GnS9qeIx32MFUzK6hA+Wi0BJBUOq++RMm/lz9G9yCjEP3eC2D0Q+l2i7qZHRYHVyN918hTHcHtEMhnadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U22BKhNQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U22BKhNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AFD1F000E9;
	Fri, 17 Jul 2026 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784331085;
	bh=EcpRqafsRY9Fd5gEM2EEVw/VXIVhMBz6Ls6T6wp2YOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=U22BKhNQGjXYomAAWpvvrGN0Xe6c1E2RCbpK5Q2ipQusYx8cydNf0JIH4tpulRpUk
	 +9dnjD0JJSufl+zHReyqHPuNhscPhc2GE/sKphqPrrzF1LyGQVS8A6IAgX/lBQsUzi
	 loPNQaKAq/lOEg9/MTm1ovOhjypsUkgVgK9EApTS4TMCAjaC+crHj/UEuNfycUAHLd
	 xvja/x8MMwtcVYy8gJmOLkVTOdbwKh+NzUStg8lyMhSoPFPB8djl3JilOKThBMSyNH
	 EIA+dEw+KSZRV7SNgLXWrPvfXSRz/tZ5D7a7T9imldP4JMAC725xs3faBrlk6arghQ
	 xmBz5vAOHouXg==
Date: Fri, 17 Jul 2026 18:31:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] regmap: Clarify _regmap_update_bits() 'async'
 kernel-doc
Message-ID: <20260717233124.GA216954@bhelgaas>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89cb2459-3d47-4ed6-8406-c6908320f791@sirena.org.uk>

On Fri, Jul 17, 2026 at 11:59:14PM +0100, Mark Brown wrote:
> On Fri, Jul 17, 2026 at 03:50:31PM -0500, Bjorn Helgaas wrote:
> 
> > Reword it to clarify the read-modify-write mechanics: when 'async' is true,
> > the write is queued asynchronously, but the read will still be synchronous
> > unless the device uses a register cache.
> 
> > - * If async is true:
> > - *
> > - * With most buses the read must be done synchronously so this is most useful
> > - * for devices with a cache which do not need to interact with the hardware to
> > - * determine the current register value.
> > + * If async is true, queue an asynchronous write. However, most buses
> > + * require synchronous reads, so the read-modify-write cycle will still
> > + * block on the read unless the device uses a register cache.  Therefore,
> > + * this flag is most useful for cached devices, where the current value can
> > + * be read from memory without hardware I/O.
> 
> That's...  verbose.  If you want to add a statement that async mode
> will be using async I/O then possibly I guess but there's a whole bunch
> more there.

The main problem is that the current text doesn't read well because
"if async is true" isn't connected to the rest.

There are three functions that take an "async" parameter, but two just
pass it on to regmap_update_bits_base(), so that seems like a
reasonable single place to say something about it.

Maybe something like this would be enough?

  If async is true, queue an asynchronous write. However, reads are
  synchronous on most buses, so they will still block unless the
  device uses a register cache.

